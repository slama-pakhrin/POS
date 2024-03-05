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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy, HH:mm:ss a"
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        cell.dateDisplay.text = dateString
        cell.itemDisplay.text = "\(dataCollection.historyData[indexPath.row].soldItemQuantity) X \(dataCollection.historyData[indexPath.row].soldItemName)"
        return cell
    }
}
