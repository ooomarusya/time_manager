//
//  ViewController2.swift
//  TimeManager
//
//  Created by Мария Хныкина on 29.09.2022.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = defaults.integer(forKey: "index")
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as? MyTableViewCell) else {
            fatalError()
        }
        let index = defaults.integer(forKey: "index")
        cell.myLable.text = defaults.string(forKey: String(index - 1 - indexPath.row))
        return cell
    }
    

}
