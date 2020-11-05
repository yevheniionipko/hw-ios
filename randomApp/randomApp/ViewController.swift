//
//  ViewController.swift
//  randomApp
//
//  Created by Onipko Jenya on 27.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    let blackView = UIView()
    var counter: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getView()
    }
    
    func getView() {
        blackView.backgroundColor = .black
        blackView.frame = CGRect(x: 0, y: 0, width: 100, height: 100);
        view.addSubview(blackView)
    }
    
    func setRandomPlace() {
        let size: CGRect = view.bounds
        counter = counter + 1
        textLabel.text = "\(counter)"
        let randomX = abs(CGFloat.random * size.width - 100)
        let randomY = abs(CGFloat.random * size.height - 100)
        blackView.frame = CGRect(x: randomX, y: randomY, width: 100, height: 100);
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setRandomPlace()
    }

}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}


