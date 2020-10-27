//
//  LastNameController.swift
//  formApp
//
//  Created by Onipko Jenya on 20.10.2020.
//

import UIKit

protocol LastNameDataDelegate: class {
    func handleLastNameInput(text: String?)
    func confirm()
}

class LastNameController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    weak var delegate: LastNameDataDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "LastNameScreen":
            guard let destinationVC = segue.destination as? ConfirmationController else { return }
            destinationVC.delegate = self
        default: break
        }
    }
    
    func confirmAction() -> Void {
        delegate?.confirm()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        text.text = "hello"
    }
    @IBAction func onNext(_ sender: UIButton) {
        delegate?.handleLastNameInput(text: textField.text)
        performSegue(withIdentifier: "LastNameScreen", sender: nil)
    }
}

extension LastNameController: ConfirmationDataDelegate {
    func confirm() {
        confirmAction()
    }
}
