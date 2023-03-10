//
//  TableViewController.swift
//  TableViews
//
//  Created by Ayush Bhatt on 09/03/23.
//

import UIKit

class TableViewController: UITableViewController {
    let model = [
        "One",
        "Two",
        "Three"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model[indexPath.row])
    }
}
