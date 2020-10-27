//
//  ViewController.swift
//  formApp
//
//  Created by Onipko Jenya on 20.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    var firstName: String = ""
    var lastName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "FirstNameScreen":
            guard let destinationVC = segue.destination as? LastNameController else { return }
            destinationVC.delegate = self
        default: break
        }
    }
    
    func confirmAction() -> Void {
        mainLabel.text = "\(String(firstName)) \(String(lastName))"
    }
    
    func inputLastName(text: String?) -> Void {
        lastName = text!
    }

    @IBAction func onNext(_ sender: UIButton) {
        firstName = textField.text!
        performSegue(withIdentifier: "FirstNameScreen", sender: nil)
    }
    
}

extension ViewController: LastNameDataDelegate {
    func handleLastNameInput(text: String?) {
        inputLastName(text: text)
    }
    func confirm() -> Void {
        confirmAction()
    }
}
