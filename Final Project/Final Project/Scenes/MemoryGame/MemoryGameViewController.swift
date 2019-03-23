//
//  MemoryGameViewController.swift
//  Final Project
//
//  Created by Luis Padilla  on 3/22/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit
import JGProgressHUD

protocol MemoryGameDisplayLogic: class {
    func displayDataSource(viewModel : MemoryGame.DataSource.ViewModel)
}

class MemoryGameViewController: UIViewController, MemoryGameDisplayLogic {
    
    var dataSource = [MemoryGame.DataSource.ViewModel.CardItem]()
    var activityIndicator = JGProgressHUD(style: .dark)
    var interactor: MemoryGameBusinessLogic?
    var router: (NSObjectProtocol & MemoryGameRoutingLogic & MemoryGameDataPassing)?
    private let sectionInsets = UIEdgeInsets(top: 5.0,
                                             left: 5.0,
                                             bottom: 5.0,
                                             right: 5.0)
    
    // Game logic
    var gameFinished = false
    
    var selectedItems = [MemoryGame.DataSource.ViewModel.CardItem]()
    
    
    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MemoryGameInteractor()
        let presenter = MemoryGamePresenter()
        let router = MemoryGameRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.textLabel.text = "Loading..."
        registerCustomCell()
        startGame()
    }
    
    func startGame(){
        self.requestDataSource()
    }
    
    // MARK: Request logic
    func requestDataSource() {
        activityIndicator.show(in: view)
        let request = MemoryGame.DataSource.Request.init(rows : Constants.Config.Rows, columns: Constants.Config.Columns)
        interactor?.requestDataSource(request: request)
    }
    
    
    // MARK: Display logic
    func displayDataSource(viewModel: MemoryGame.DataSource.ViewModel) {
        activityIndicator.dismiss()
        dataSource = viewModel.displayedItems
        collectionView.reloadData()
        // memeTableView.reloadData()
    }
    
    @IBAction func RestartGame(_ sender: UIButton) {
        self.startGame()
    }
}

extension MemoryGameViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func registerCustomCell(){
         collectionView?.register(R.nib.cardCollectionViewCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.cardCell, for: indexPath) else {
            return UICollectionViewCell()
        }
        cell.setupCell(item: dataSource[indexPath.row])
        return cell
    }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dataSource = self.flipCard(index : indexPath.row)
         self.collectionView.reloadData()
        if(self.hasFinishedGame(cards : self.dataSource)){
            self.showGameFinishedAlert()
        }
    }

}

extension MemoryGameViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let rows = CGFloat(Constants.Config.Rows)
        // let paddingSpace = (self.sectionInsets.left + self.sectionInsets.right)  * rows
        let frameWidth = view.frame.width
        let availableWidth = frameWidth
        let widthPerItem = availableWidth / rows
        
         return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets()
//        // return self.sectionInsets
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return self.sectionInsets.left
//    }
}

extension MemoryGameViewController {
    
    func flipCard(index: Int) -> [MemoryGame.DataSource.ViewModel.CardItem]{
        
        var changedCards = self.dataSource
        
        changedCards[index].isFlipped = true
        
        let alreadyFlippedCardsInGame = changedCards.filter({ card -> Bool in
            return !card.isAlreadyGuessed && card.isFlipped
        })
        
        if alreadyFlippedCardsInGame.count == 2 {
            
            let firstCardUrl = alreadyFlippedCardsInGame[0].id
            let secondCardUrl = alreadyFlippedCardsInGame[1].id
            
            let playerGuessedRight = firstCardUrl == secondCardUrl
            
            if playerGuessedRight {
                changedCards = checkGuessedCards(for: firstCardUrl, in: changedCards)
            }
        }
        
        if alreadyFlippedCardsInGame.count == 3 {
            changedCards = flipBackCard(changedCards, exceptIndex: index)
        }
        
        return changedCards
    }
    
    func checkGuessedCards(for id: Int, in cards: [MemoryGame.DataSource.ViewModel.CardItem]) -> [MemoryGame.DataSource.ViewModel.CardItem] {
        var changedCards = cards
        for index in 0 ..< cards.count {
            if cards[index].id == id {
                changedCards[index].isAlreadyGuessed = true
            }
        }
        
        return changedCards
    }
    
    func flipBackCard (_ cards: [MemoryGame.DataSource.ViewModel.CardItem], exceptIndex: Int) -> [MemoryGame.DataSource.ViewModel.CardItem] {
        var changedCards = cards
        for index in 0 ..< cards.count {
            if index != exceptIndex {
                changedCards[index].isFlipped = false
            }
        }
        
        return changedCards
    }
    
    func hasFinishedGame(cards: [MemoryGame.DataSource.ViewModel.CardItem]) -> Bool {
        
        for card in cards {
            if !card.isAlreadyGuessed {
                return false
            }
        }
        
        return true
    }
    
    
    static func generateNewCards( memes : [Meme]) -> [MemoryGame.DataSource.ViewModel.CardItem] {
        
        let differentImagesSize = (Constants.Config.Rows * Constants.Config.Columns) / 2
        let memesShuffled = memes.shuffled()
        let differentMemes = memesShuffled.prefix(differentImagesSize)
 
        var displayedMemes = differentMemes.map({
            MemoryGame.DataSource.ViewModel.CardItem.init( id : $0.id, url : URL(string : $0.url), placeHolderImage : R.image.notFound())
        })
        
        displayedMemes.append(contentsOf: displayedMemes)
        return displayedMemes.shuffled()
    }

    
    fileprivate func showGameFinishedAlert() {
        let alertController = UIAlertController(title: "You won the game", message: "Do you want to start again?", preferredStyle: .alert)
    
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.startGame()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
}


extension UIViewController {
    static func showErrorAlertController(message : String, viewController : UIViewController) {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            viewController.present(alertController, animated: true, completion: nil)
    }
}
