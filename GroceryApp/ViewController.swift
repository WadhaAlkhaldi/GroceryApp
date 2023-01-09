//
//  ViewController.swift
//  GroceryApp
//
//  Created by Wadha Alkhaldi on 15/06/1444 AH.
//

import UIKit
import Firebase
class ViewController: UIViewController ,  UITableViewDelegate, UITableViewDataSource{
   
    
    let ref = Database.database().reference(withPath: "Item")
    var items:[Grocery] = []
    
   
    var addingTextField: UITextField?
    var updatingTextField: UITextField?

   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
            tableView.dataSource = self
        ref.observe(.value, with: { snapshot in
            print(snapshot.value as Any )
        })
        ref.observe(.value, with: { snapshot in
            var newItem: [Grocery] = []
            for child in snapshot.children{
                if let snapshot = child as? DataSnapshot,
                   let itms = Grocery(snapshot: snapshot){
                       newItem.append(itms)
                }
            }
            self.items = newItem
            self.tableView.reloadData()
             })
       
    }
    
    @IBAction func add(_ sender: Any) {
        showalert()
    }
    
    func showalert(){
        let alert = UIAlertController(title: "Grocery item", message: "Add an item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
           
            let adding = Grocery(itemName: self.addingTextField!.text!, userId: "")
                let addPersonRef = self.ref.childByAutoId()
                addPersonRef.setValue(adding.toAnyObject())
              print(self.addingTextField!)
            }
        ))
        alert.addTextField { textField in
            
            self.addingTextField = textField
          
            self.addingTextField?.placeholder = ""
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func update (){
        let alert = UIAlertController(title: "Grocery item", message: "Update an item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
           
            let adding = Grocery(itemName: self.updatingTextField!.text!, userId: "")
                let addPersonRef = self.ref.childByAutoId()
                addPersonRef.setValue(adding.toAnyObject())
              print(self.updatingTextField!)
            }
        ))
        alert.addTextField { textField in
            
            self.updatingTextField = textField
          
            self.updatingTextField?.placeholder = ""
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                  return  items.count
                    
                }
                
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! itemsCell
                    let itemObject = items[indexPath.row]
                    cell.itemLabel.text = itemObject.itemName
                    cell.userLabel.text = itemObject.userId
                    return cell
                }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: "Grocery item", message: "Update an item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
           
            let adding = Grocery(itemName: self.updatingTextField!.text!, userId: "")
                let addPersonRef = self.ref.childByAutoId()
                addPersonRef.setValue(adding.toAnyObject())
              print(self.updatingTextField!)
            }
        ))
        alert.addTextField { textField in
            
            self.updatingTextField = textField
          
            self.updatingTextField?.placeholder = ""
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    }
    
            
    
                    
