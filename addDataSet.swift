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
    
    var retreivedTitle : String?
    var retreivedQuantity : Int!
    var retreivedValue: Double!
    var retreivedIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = retreivedTitle
        quantityField.text = String(retreivedQuantity)
        valueField.text = String(retreivedValue)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func saveEdits(_ sender: Any) {
        if(titleField != nil && quantityField != nil && valueField != nil){
            dataCollection.data[retreivedIndex].title = titleField.text!
            dataCollection.data[retreivedIndex].quantity = Int(quantityField.text!)!
            dataCollection.data[retreivedIndex].price = Double(valueField.text!)!
        }
        
    }
    
    
}
