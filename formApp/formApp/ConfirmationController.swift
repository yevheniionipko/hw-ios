//
//  ConfirmationScreen.swift
//  formApp
//
//  Created by Onipko Jenya on 20.10.2020.
//

import UIKit

protocol ConfirmationDataDelegate: class {
    func confirm()
}

class ConfirmationController: UIViewController {
    weak var delegate: ConfirmationDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onFinish(_ sender: UIButton) {
        delegate?.confirm()
        navigationController?.popToRootViewController(animated: true)
    }
}
