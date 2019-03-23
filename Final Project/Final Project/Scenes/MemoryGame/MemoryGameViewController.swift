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
    
    var dataSource = [MemoryGame.DataSource.ViewModel.DisplayedItem]()
    var activityIndicator = JGProgressHUD(style: .dark)
    var interactor: MemoryGameBusinessLogic?
    var router: (NSObjectProtocol & MemoryGameRoutingLogic & MemoryGameDataPassing)?
    
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
    
    
}
