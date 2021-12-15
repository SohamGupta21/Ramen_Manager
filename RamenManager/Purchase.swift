//
//  Purchase.swift
//  RamenManager
//
//  Created by Conant high on 12/15/21.
//

import Foundation

class Purchase {
    var description: String
    var date: Date
    var price: Float
    
    init(description:String, date:Date, price:Float){
        self.description = description
        self.date = date
        self.price = price
    }
}
