//
//  NumbersViewController.swift
//  Tarea 2
//
//  Created by Luis Padilla  on 2/11/19.
//  Copyright © 2019 Luis Padilla . All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var NumbersTable: UITableView!
    let customTableIdentifier = "NumbersTableViewCell"
    
    let numbers = Array(1000...1999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
         registerCustomTableView()
        // Do any additional setup after loading the view.
    }
    
    func registerCustomTableView(){ // primero registro celda
        let nib = UINib(nibName: "NumbersTableViewCell", bundle: nil)
        NumbersTable.register(nib, forCellReuseIdentifier : self.customTableIdentifier)
    }
    
    func Pair(num : Int) -> Bool {
        return num % 2 == 0
    }

}

extension NumbersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.customTableIdentifier) as? NumbersTableViewCell else {
            return UITableViewCell()
        }
        
        let backgroundColor = self.Pair(num : indexPath.row) ? UIColor.blue : UIColor.red
        cell.backgroundColor = backgroundColor
    
        return cell
    }
    
    
}
