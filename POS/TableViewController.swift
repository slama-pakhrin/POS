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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataCollection.data.count;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    
//    @IBAction func doneClicked(_ sender: Any) {
//        performSegue(withIdentifier: "unwind", sender: self)
//    }
    
    
}
