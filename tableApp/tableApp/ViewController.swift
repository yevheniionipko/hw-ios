//
//  ViewController.swift
//  tableApp
//
//  Created by Onipko Jenya on 05.11.2020.
//

import UIKit

struct Students {
    let name: String
    let nickname: String
}

let students: [Students] = [
    Students(name: "Yevhenii", nickname: "yevheniionipko"),
    Students(name: "Artem", nickname: "artem"),
    Students(name: "evgen patlay", nickname: "evgen"),
    Students(name: "Aleksander", nickname: "Fight3d"),
    Students(name: "Bohdan", nickname: "syvashenkoBohdan"),
]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentRow") else { fatalError() }
        cell.textLabel?.text = students[indexPath.row].name
        cell.detailTextLabel?.text = students[indexPath.row].nickname
        return cell
    }

}
