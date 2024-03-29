//
//  addDataSet.swift
//  POS
//
//  Created by Arii on 2024-03-05.
//

import UIKit

class addDataSet: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    
    //these are optionals since it's sent from the previous view
    var retreivedTitle : String?
    var retreivedQuantity : Int?
    var retreivedValue: Double?
    var retreivedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = retreivedTitle
        quantityField.text = String(retreivedQuantity!)
        valueField.text = String(retreivedValue!)
        navigationController?.isNavigationBarHidden = true //hiding navbar and tabbar
        tabBarController?.tabBar.isHidden = true
    }
    
    //when heading back to Edit, navbar and tabbar needs to be visible
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func saveEdits(_ sender: Any) {
        //if this view is instantiated through a row inside a table, this condition runs and it modifies the data
        if(titleField != nil && quantityField != nil && valueField != nil && retreivedIndex != nil){
            dataCollection.data[retreivedIndex!].title = titleField.text!
            dataCollection.data[retreivedIndex!].quantity = Int(quantityField.text!)!
            dataCollection.data[retreivedIndex!].price = Double(valueField.text!)!
        }
        //if this view is instantiated through + sign, this condition runs and it creates a new data item & it is where retrieveIndex is useful
        if(titleField != nil && quantityField != nil && valueField != nil && retreivedIndex == nil){
            let newObject = item(title: titleField.text!, quantity: Int(quantityField.text!)!, price: Double(valueField.text!)!)
            dataCollection.data.append(newObject)
        }
    }
}
