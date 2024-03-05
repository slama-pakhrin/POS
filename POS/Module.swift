//
//  Module.swift
//  POS
//
//  Created by Arii on 2024-02-29.
//

import Foundation

//all the data that are used in this project is referring to this file
//item holds our products
//collection holds the instances of item and History
//History holds the sold products

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
    var data =
    [item(title: "Computer", quantity: 4, price: 400.99),
     item(title: "Monitor", quantity: 4, price: 200.99)]
    var historyData : [History] = []
}

class History{
    var soldItemName : String
    var soldItemQuantity : Int
    init(soldItemName: String, soldItemQuantity: Int) {
        self.soldItemName = soldItemName
        self.soldItemQuantity = soldItemQuantity
    }
}
