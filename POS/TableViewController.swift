//
//  TableViewController.swift
//  POS
//
//  Created by Arii on 2024-03-04.
//

import UIKit

class edit: UITableViewController, UITabBarDelegate {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCollection.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as! editTableViewCell
        cell.labelAtTop.text = "\(dataCollection.data[indexPath.row].title) (\(dataCollection.data[indexPath.row].quantity))"
        cell.labelAtBottom.text = "$ \(String(dataCollection.data[indexPath.row].price))"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let myViewController = storyboard?.instantiateViewController(withIdentifier: "changeDataVC") as! addDataSet

        navigationController?.pushViewController(myViewController, animated: true)
        
        myViewController.retreivedTitle = dataCollection.data[indexPath.row].title
        myViewController.retreivedValue = dataCollection.data[indexPath.row].price
        myViewController.retreivedQuantity = dataCollection.data[indexPath.row].quantity
        myViewController.retreivedIndex = indexPath.row
    }
//    @IBAction func doneClicked(_ sender: Any) {
//        performSegue(withIdentifier: "unwind", sender: self)
//    }
    
    @IBAction func unwindToEdit(_ segue: UIStoryboardSegue){
        
    }
}
