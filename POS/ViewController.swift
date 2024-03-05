//
//  ViewController.swift
//  POS
//
//  Created by Arii on 2024-02-27.
//

import UIKit

let dataCollection = collection()
var selectedRow : Int?

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
  
    
    @IBOutlet weak var displayFinalValue: UILabel!
    @IBOutlet weak var displayItems: UIPickerView!
    @IBOutlet weak var selectedItem: UILabel!
    @IBOutlet weak var inputQuantityDisplay: UITextField!
    
    @IBOutlet weak var confirmBuy: UIImageView!
    //    @IBOutlet var allButtons : [UIButton]!
    
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        var itemCount : String;
        displayItems.delegate = self;
        displayItems.dataSource = self;
        //default display value
//        selectedItem.text = items[0][0]
        inputQuantityDisplay.textAlignment = .right;
        buyButton.isEnabled = false
        inputQuantityDisplay.text = "0"
        displayFinalValue.text = "0"
        displayFinalValue.textAlignment = .right
    }
    
    
    // defines number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //        return dataCollection.data[0].getColumns()
        return 1
    }
    // defines number of rows
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
        displayFinalPrice()
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        inputQuantityDisplay.text?.popLast()
        if(inputQuantityDisplay.text?.count != 0){
            buyButtonEnabled()
            displayFinalPrice()
        }
        else if(inputQuantityDisplay.text?.count == 0){
            buyButton.isEnabled = false
            displayFinalValue.text = "0"
            displayFinalValue.textColor = .black
        }
    }
    
    @IBAction func clearClicked(_ sender: Any) {
        inputQuantityDisplay.text? = ""
        buyButton.isEnabled = false
        displayFinalValue.text = "0"
        displayFinalValue.textColor = .black
    }
    
    func buyButtonEnabled(){
        
        let quantityCount = ((inputQuantityDisplay.text) ?? "0")
        let numQualityCount = Int(quantityCount)
        
        if(numQualityCount! <= dataCollection.data[selectedRow ?? 0].quantity && numQualityCount! > 0){
            buyButton.isEnabled = true
        }
        else{
            buyButton.isEnabled = false
        }
    }
    
    func displayFinalPrice(){
        let quantityCount = ((inputQuantityDisplay?.text) ?? "0")
        let numQualityCount = Double(quantityCount)!
        let finalValue = "\(numQualityCount * dataCollection.data[selectedRow ?? 0].price)"
        displayFinalValue.text = finalValue
        print(finalValue)
        print(dataCollection.data[selectedRow ?? 0].quantity)
        if(Int(numQualityCount) > dataCollection.data[selectedRow ?? 0].quantity){
            displayFinalValue.textColor = .red
        }
        else{
            displayFinalValue.textColor = .black
        }
    }
    
    @IBAction func buyButtonClicked(_ sender: Any) {
        //        let confirmImage =
        
        confirmBuy.image = UIImage(systemName: "checkmark.rectangle")
        
    }
    
    @IBAction func managerAccessButtonClicked(_ sender: Any) {
        let passcode = "1234"
        
        let alert = UIAlertController(title: "Enter Code", message: nil, preferredStyle: .alert)
        alert.addTextField{ (passcode) in
            passcode.isSecureTextEntry = true
        }
        
        
        let submitButton = UIAlertAction(title: "Submit", style: .default){ _ in
            if var passcodeEntered = alert.textFields?.first?.text{
                if(passcode == passcodeEntered){
                    self.performSegue(withIdentifier: "toTabBar", sender: self)
                }
                else{
                    passcodeEntered = ""
                }
            }
        }
        
        alert.addAction(submitButton)
        present(alert, animated: true)
    }
    
    
    @IBAction func unwindToSourceViewController(_ segue: UIStoryboardSegue) {
        
        
    }
    
}

