//
//  ViewController.swift
//  Todolist
//
//  Created by Simranjeet  Singh on 2019-03-04.
//  Copyright © 2019 Simranjeet  Singh. All rights reserved.
//

import UIKit



class TodoListViewController: UITableViewController {
    let itemArray = ["Simranjeet", "Sourav", "Sahil" ]
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
//    TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
   cell.textLabel?.text = itemArray[indexPath.row]
       
        return cell 
    }
//MARK - TableView Delegate Methods 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
//        print (itemArray[indexPath.row])
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
// Add a new BarButton
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todolist Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the Add Item button on our UIAlert
            print("Success!")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

