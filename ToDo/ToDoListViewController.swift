//
//  ViewController.swift
//  ToDo
//
//  Created by Subhash Dasari on 24/01/19.
//  Copyright © 2019 Subhash Dasari. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var content = ["BRN","Udemy","Varnith"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = content[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "ADD", message: "Add Your To Do List", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add Content", style: .default) { (action) in
            self.content.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField(configurationHandler: { (alertTextFiled) in
            textField = alertTextFiled
        })

        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

