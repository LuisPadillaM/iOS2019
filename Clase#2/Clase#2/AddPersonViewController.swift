//
//  AddPersonViewController.swift
//  Clase#2
//
//  Created by Cesar Brenes on 1/26/19.
//  Copyright © 2019 VeuxLabs. All rights reserved.
//

import UIKit

protocol AddPersonViewControllerDelegate : class {
    func addPerson(person : Person)
}

extension AddPersonViewControllerDelegate {
    func addPerson(person : Person) {}
}

class AddPersonViewController: UIViewController {

    weak var delegate : AddPersonViewControllerDelegate?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBAction func dismissKeyboard(_ sender: UIControl) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addPerson(_ sender: Any) {
        if let name = nameTextField.text, let lastName = lastNameTextField.text, name.count > 0, lastName.count > 0 {
            addPerson(name : name, lastName : lastName)
        } else {
            showAlertController();
        }
    }
    
    func addPerson(name : String, lastName : String) {
        let person = Person.init(name : name, lastName: lastName)
        delegate?.addPerson(person: person)
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title : "Error", message : "Debe llenar todos los campos", preferredStyle : .alert)
        // si no ocupara manejar el ok pongo handler : nil
        let action = UIAlertAction(title : "OK", style : .default) { (_) in
            self.nameTextField.becomeFirstResponder()
        }
        alertController.addAction(action)
        present(alertController, animated : true, completion: nil)
    }

}
