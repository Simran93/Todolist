//
//  CategoryViewController.swift
//  Todolist
//
//  Created by Simranjeet  Singh on 2019-10-06.
//  Copyright © 2019 Simranjeet  Singh. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
//MARK: - Table View Data Source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        
        
        return cell
        
    }
    
//MARK: - Table Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
      if let indexPath = tableView.indexPathForSelectedRow {
        destinationVC.selectedCategory = categories[indexPath.row]
            
        }
    }
    
    
//MARK: - Add new item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
         var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todolist Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
 //MARK: - what will happen once the user clicks the Add Category button on our UIAlert
        let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
             self.saveCategories()
}
        
        alert.addTextField { (alertTextField) in
            textField = alertTextField
            alertTextField.placeholder = "Create New Category"
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
//MARK: - Data Minipulation methods
    
    func saveCategories(){
       do{
           try context.save()
        }catch{
            print("Error saving context\(error)")
            
        }
        
        tableView.reloadData()
        
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
           do {
                categories = try context.fetch(request)
            }catch {
                print("Error fetching data from context\(error)")
            }
            tableView.reloadData()
    }
    
}
