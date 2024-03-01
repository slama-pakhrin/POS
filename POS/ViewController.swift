//
//  ViewController.swift
//  POS
//
//  Created by Arii on 2024-02-27.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let items = [["Computer", "4", "$400.99"],["Monitor", "4", "$200.99"]]
//    let items = ["Computer", "Monitor"]
//    let itemsQuantity = ["4", "4"]
//    let itemsPrice = ["400.99", "200.99"]
    let columns = 3;
    let dataCollection = collection()
    var selectedRow : Int?

    @IBOutlet weak var displayFinalValue: UILabel!
    @IBOutlet weak var displayItems: UIPickerView!
    @IBOutlet weak var selectedItem: UILabel!
    @IBOutlet weak var inputQuantityDisplay: UITextField!
    
//    @IBOutlet var allButtons : [UIButton]!
    
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var itemCount : String;
        displayItems.delegate = self;
        displayItems.dataSource = self;
        //default display value
        selectedItem.text = items[0][0]
        inputQuantityDisplay.textAlignment = .right;
        buyButton.isEnabled = false
        inputQuantityDisplay.text = "0"
        displayFinalValue.text = "0"
    }
    
    
    // defines number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return dataCollection.data[0].getColumns()
        return 1
    }
    // defines number of rows in each column
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataCollection.data.count;
    }
   
    //defines content to be displayed in each field
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        itemCount = items[row][component]
        return "\(dataCollection.data[row].title) \u{00A0} \u{00A0} \u{00A0} \u{00A0} \(dataCollection.data[row].quantity) \u{00A0} \u{00A0} \u{00A0} \u{00A0} $\(dataCollection.data[row].price)"
        
    }
    //displaying the choosen item
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem.text = dataCollection.data[row].title
        selectedRow = row
        
    }

    
    @IBAction func buttonsClicked(_ sender: UIButton) {
        
        inputQuantityDisplay.text! += (sender.titleLabel?.text)!
        buyButtonEnabled()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        inputQuantityDisplay.text?.popLast()
        if(inputQuantityDisplay.text?.count != 0){
            buyButtonEnabled()
        }
        else if(inputQuantityDisplay.text?.count == 0){
            buyButton.isEnabled = false
        }
    }
    
    @IBAction func clearClicked(_ sender: Any) {
        inputQuantityDisplay.text? = ""
        buyButton.isEnabled = false
    }
    
    func buyButtonEnabled(){
        let quantityCount = ((inputQuantityDisplay.text) ?? "0")
        let numQualityCount = Int(quantityCount)
        if(numQualityCount! <= dataCollection.data[selectedRow ?? 0].quantity){
            buyButton.isEnabled = true
            print("hmm")
        }
        else{
            buyButton.isEnabled = false
        }
    }
   
    @IBAction func buyButtonClicked(_ sender: Any) {
        let confirmImage = UIImage(systemName: "checkmark.rectangle")
        
        let quantityCount = ((inputQuantityDisplay.text) ?? "0")
        let numQualityCount = Double(quantityCount)!
        displayFinalValue.text = "\(numQualityCount * dataCollection.data[selectedRow ?? 0].price) \(confirmImage)"
        
    }
    
    
}
