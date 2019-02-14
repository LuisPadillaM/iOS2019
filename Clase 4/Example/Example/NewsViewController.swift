//
//  NewsViewController.swift
//  Example
//
//  Created by Luis Padilla  on 2/11/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    let customTableIdentifier = "NewsTableViewCell"

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomTableView()
    }
    
    func registerCustomTableView(){ // primero registro celda
        let nib = UINib(nibName: customTableIdentifier, bundle: nil)
        newsTableView.register(nib, forCellReuseIdentifier : self.customTableIdentifier)
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableIdentifier) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
}
