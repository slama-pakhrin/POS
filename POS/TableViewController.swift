//
//  TableViewController.swift
//  POS
//
//  Created by Arii on 2024-03-04.
//

import UIKit

class edit: UITableViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCollection.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as! editTableViewCell
        cell.labelAtTop.text = "\(dataCollection.data[indexPath.row].title) (\(dataCollection.data[indexPath.row].quantity))"
        cell.labelAtBottom.text = "$ \(String(dataCollection.data[indexPath.row].price))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "anythingWorks", bundle: nil)
        let myViewController = storyboard.instantiateViewController(withIdentifier: "changeDataVC")
        present(myViewController, animated: true)
    }
//    @IBAction func doneClicked(_ sender: Any) {
//        performSegue(withIdentifier: "unwind", sender: self)
//    }
    
    
}
