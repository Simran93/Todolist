//
//  ViewController.swift
//  Todolist
//
//  Created by Simranjeet  Singh on 2019-03-04.
//  Copyright © 2019 Simranjeet  Singh. All rights reserved.
//

 import UIKit



  class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
        
        loadItems()

    }
//    TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
       
        return cell 
    }
//MARK - TableView Delegate Methods 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
//        print (itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
         saveItems()
         tableView.reloadData()
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
// Add a new BarButton
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todolist Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the Add Item button on our UIAlert
            let newitem = Item()
            newitem.title = textField.text!
            self.itemArray.append(newitem)
           
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

func saveItems(){
    let encoder = PropertyListEncoder()
    do{
        let data = try encoder.encode(itemArray)
        try data.write(to: dataFilePath!)
    }catch{
        print("Error encoding item array,\(error)")
        
    }
    
    tableView.reloadData()
    
}
    func loadItems(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
                itemArray = try decoder.decode([Item].self, from: data)
            }catch{
                print("Error decoding item array,\(error)")
            }
    
            
        
    }
    

}
}
