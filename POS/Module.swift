//
//  Module.swift
//  POS
//
//  Created by Arii on 2024-02-29.
//

import Foundation

//this file is created to resolve the problem: to pass the integer inside pickerview that was stored as string but displayed as an integer to evaluate with the value inside textField in order to check buy button visibility
//using class

class item{
    var title: String
    var quantity: Int
    var price: Double
    init(title: String, quantity: Int, price: Double) {
        self.title = title
        self.quantity = quantity
        self.price = price
    }
    func getColumns() -> Int {
        return Mirror(reflecting: self).children.count
    }
}

class collection{
    var data = [item(title: "Computer", quantity: 4, price: 400.99),item(title: "Monitor", quantity: 4, price: 200.99)]
    
}
