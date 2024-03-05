//
//  history.swift
//  POS
//
//  Created by Arii on 2024-03-04.
//

import UIKit

class history: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCollection.historyData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! historyTableViewCell
        let dateFormatter = DateFormatter() //calling this pre-defined function to display the date in a particular format
        dateFormatter.dateFormat = "MM/dd/yyyy, HH:mm:ss a"
        let currentDate = Date() //holds the current date as name says
        let dateString = dateFormatter.string(from: currentDate) //date gets formatted
        cell.dateDisplay.text = dateString
        //historyData being an array of objects which holds the bought item names and count
        cell.itemDisplay.text = "\(dataCollection.historyData[indexPath.row].soldItemQuantity) X \(dataCollection.historyData[indexPath.row].soldItemName)"
        return cell
    }
}
