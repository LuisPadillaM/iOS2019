//
//  MemeSearchViewController.swift
//  Clase 6
//
//  Created by Luis Padilla  on 2/23/19.
//  Copyright (c) 2019 Luis Padilla . All rights reserved.
//

import UIKit
import JGProgressHUD

protocol MemeSearchDisplayLogic: class {
    func displayDataSource(viewModel : MemeSearch.DataSource.ViewModel)
}

class MemeSearchViewController: UIViewController, MemeSearchDisplayLogic {

    var interactor: MemeSearchBusinessLogic?
    var router: (NSObjectProtocol & MemeSearchRoutingLogic & MemeSearchDataPassing)?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var memeTableView: UITableView!
    
    var activityIndicator = JGProgressHUD(style: .dark)
    var dataSource = [MemeSearch.DataSource.ViewModel.DisplayedItem]()
    
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
        let interactor = MemeSearchInteractor()
        let presenter = MemeSearchPresenter()
        let router = MemeSearchRouter()
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
        registerCustomCell()
        activityIndicator.textLabel.text = "Loading..."
    }
    
    @IBAction func searchCriteriaChangedAction(_ sender: UITextField) {
        if let text = sender.text, text.isEmpty {
            searchButton.isEnabled = false
        } else {
            searchButton.isEnabled = true
        }
    }
    
    
    @IBAction func searchAction(_ sender: Any) {
        if let text = searchTextField.text, !text.isEmpty {
            requestDataSource(criteria : text)
        }
    }
    
    // MARK: Request logic
    func requestDataSource(criteria : String) {
        activityIndicator.show(in: view)
        let request = MemeSearch.DataSource.Request.init(criteria : criteria)
        interactor?.requestDataSource(request: request)
    }
    // MARK: Display logic
    
    func displayDataSource(viewModel: MemeSearch.DataSource.ViewModel) {
         activityIndicator.dismiss()
        dataSource = viewModel.displayedItems
        memeTableView.reloadData()
    }
   
}

extension MemeSearchViewController : UITableViewDelegate, UITableViewDataSource {
    func registerCustomCell(){
        memeTableView.register(UINib(resource: R.nib.memeTableViewCell), forCellReuseIdentifier : R.nib.memeTableViewCell.name)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.memeTableViewCell.name) as? MemeTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(item: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
