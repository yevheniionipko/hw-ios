//
//  ViewController.swift
//  CoffeMachine
//
//  Created by Onipko Jenya on 14.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let coffee = CoffeeMachine();
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addBeansAction(_ sender: UIButton) {
        coffee.addBeans();
    }
    @IBAction func addWaterAction(_ sender: UIButton) {
        coffee.addWater()
    }
    @IBAction func addMilkAction(_ sender: UIButton) {
        coffee.addMilk()
    }
    @IBAction func makeCoffee(_ sender: UIButton) {
        let tag: Int = sender.tag;
        
        if let coffeeType = CoffeeMachine.CoffeeType(rawValue: tag) {
            label.text = coffee.makeCoffee(type: coffeeType)
        }
        
    }
    
}

