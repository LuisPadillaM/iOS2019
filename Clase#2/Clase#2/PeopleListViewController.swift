//
//  PeopleListViewController.swift
//  Clase#2
//
//  Created by Cesar Brenes on 1/26/19.
//  Copyright © 2019 VeuxLabs. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController {

    var peopleList = [Person]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addPersonAction(_ sender: UIButton) {
        if let addPersonViewController = storyboard?.instantiateViewController(withIdentifier: "AddPersonViewController") as? AddPersonViewController{
            addPersonViewController.delegate = self
            present(addPersonViewController, animated: true, completion: nil)
        }
    }
    

}

extension PeopleListViewController : AddPersonViewControllerDelegate {
    func addPerson(person : Person){
        dismiss(animated: true, completion: nil) // se puede llamar también al otro lado
        peopleList.append(person)
        tableView.reloadData()
    }
}

extension PeopleListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()  // en caso que no haya celdas no se cae
        }
        // el indexPath tiene dos elementos section y row
        let rowElement = peopleList[indexPath.row]
        cell.textLabel?.text = "\(rowElement.name) - \(rowElement.lastName)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("LA CELDA CON EL INDEX \(indexPath.row) SE PRESIONO")
    }
    
}
