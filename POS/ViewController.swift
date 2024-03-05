//
//  ViewController.swift
//  POS
//
//  Created by Arii on 2024-02-27.
//

import UIKit

let dataCollection = collection() //global object for usage over all the views

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectedRow : Int?
    
    @IBOutlet weak var displayFinalValue: UILabel!
    @IBOutlet weak var displayItems: UIPickerView!
    @IBOutlet weak var selectedItem: UILabel!
    @IBOutlet weak var inputQuantityDisplay: UITextField!
    @IBOutlet weak var confirmBuy: UIImageView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    
    //all the things to occur in the very beginning of this application
    override func viewDidLoad() {
        super.viewDidLoad()
        displayItems.delegate = self;
        displayItems.dataSource = self;
        inputQuantityDisplay.textAlignment = .right;
        buyButton.isEnabled = false
        inputQuantityDisplay.text = "0"
        displayFinalValue.text = "0"
        displayFinalValue.textAlignment = .right
        confirmBuy.image = UIImage(systemName: "checkmark.rectangle")
        confirmBuy.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayItems.reloadAllComponents() //coming back from unwind segue, the data needs to be updated
    }
    
    // defines number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // defines number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataCollection.data.count;
    }
    
    //defines content to be displayed in each field
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(dataCollection.data[row].title) \u{00A0} \u{00A0} \u{00A0} \u{00A0} \(dataCollection.data[row].quantity) \u{00A0} \u{00A0} \u{00A0} \u{00A0} $\(dataCollection.data[row].price)"
    }
    //displaying the choosen item
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem.text = dataCollection.data[row].title
        selectedRow = row //selected row holds the current row inside pickerview which is passed to all the data displaying elements to correctly display the data
        inputQuantityDisplay.text = ""
        buyButton.isEnabled = false
    }
    //any numbers clicked will trigger this function
    @IBAction func buttonsClicked(_ sender: UIButton) {
        inputQuantityDisplay.text! += (sender.titleLabel?.text)!
        buyButtonEnabled()
        displayFinalPrice()
        confirmBuy.isHidden = true
    }
    //back button in the num pad will trigger this function
    @IBAction func backButtonClicked(_ sender: Any) {
        inputQuantityDisplay.text?.popLast()
        confirmBuy.isHidden = true
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
    //clear button will trigger this function
    @IBAction func clearClicked(_ sender: Any) {
        inputQuantityDisplay.text? = ""
        buyButton.isEnabled = false
        displayFinalValue.text = "0"
        displayFinalValue.textColor = .black
        confirmBuy.isHidden = true
    }
    //this function is used to verify the visibility of the buy button
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
    //this function is responsible to display total amount of the purchase
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
    //this function is triggered when buy button is clicked and it appends the transaction into the history data
    @IBAction func buyButtonClicked(_ sender: Any) {
        confirmBuy.isHidden = false
        dataCollection.data[selectedRow ?? 0].quantity = dataCollection.data[selectedRow ?? 0].quantity - Int(inputQuantityDisplay.text!)!
        let tempData = History(soldItemName: dataCollection.data[selectedRow ?? 0].title, soldItemQuantity: Int(inputQuantityDisplay.text!)!)
        dataCollection.historyData.append(tempData)
        displayItems.reloadAllComponents()
        inputQuantityDisplay.text = ""
        buyButton.isEnabled = false
    }
    //this function is for the admin to get past this view in order to make changes in the inventory (authorization)
    @IBAction func managerAccessButtonClicked(_ sender: Any) {
        authorization()
    }
    //this function is created to call itself when the user enters incorrect passcode
    func authorization(){
        let passcode = "1234"
        let alert = UIAlertController(title: "Enter Code", message: nil, preferredStyle: .alert)
        alert.addTextField{ (passcode) in
            passcode.isSecureTextEntry = true //this is to hide the entered password
        }
        let submitButton = UIAlertAction(title: "Submit", style: .default){ _ in
            if var passcodeEntered = alert.textFields?.first?.text{
                if(passcode == passcodeEntered){
                    self.performSegue(withIdentifier: "toTabBar", sender: self)
                }
                else{
                    self.authorization()
                }
            }
        }
        alert.addAction(submitButton)
        present(alert, animated: true)
    }
    //bringing back to the initial view
    @IBAction func unwindToSourceViewController(_ segue: UIStoryboardSegue) {}
}
