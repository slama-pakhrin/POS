//
//  TableViewController.swift
//  POS
//
//  Created by Arii on 2024-03-04.
//

import UIKit

//file for the firstTab named Edit

class edit: UITableViewController, UITabBarDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData() //once unwind segue occurs, the data needs to be updated
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCollection.data.count //number of rows depends upon the data count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as! editTableViewCell //creating a reusable cell that identifies itself as "editCell"
        cell.labelAtTop.text = "\(dataCollection.data[indexPath.row].title) (\(dataCollection.data[indexPath.row].quantity))" //cells will have different values that are retrieved from module -> data where indexPath.row serves as an index for the data array
        cell.labelAtBottom.text = "$ \(String(dataCollection.data[indexPath.row].price))"
        cell.accessoryType = .disclosureIndicator //responsible for the arrow sign
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //onClick to a row, instantiates to a new VC
        let myViewController = storyboard?.instantiateViewController(withIdentifier: "changeDataVC") as! addDataSet
        navigationController?.pushViewController(myViewController, animated: true)
        myViewController.retreivedTitle = dataCollection.data[indexPath.row].title //the new VC has an optional value called retrievedTitle that will receive value when it's instantiated with respect to indexPath.row
        myViewController.retreivedValue = dataCollection.data[indexPath.row].price
        myViewController.retreivedQuantity = dataCollection.data[indexPath.row].quantity
        myViewController.retreivedIndex = indexPath.row //it is used in condition to create a new item object
    }
    
    @IBAction func unwindToEdit(_ segue: UIStoryboardSegue){
        //unwinding segue to bring the view back from the new VC
    }
    
    //this function is going to be responsible for the addition of items
    @IBAction func addNewObject(_ sender: Any) {
        let myViewController = storyboard?.instantiateViewController(withIdentifier: "changeDataVC") as! addDataSet

        navigationController?.pushViewController(myViewController, animated: true)
        myViewController.retreivedTitle = ""
        myViewController.retreivedValue = 0
        myViewController.retreivedQuantity = 0
    }
    
}
