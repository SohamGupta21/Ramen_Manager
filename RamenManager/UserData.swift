//
//  UserData.swift
//  RamenManager
//
//  Created by Conant high on 12/15/21.
//

import Foundation
import SwiftUI

class UserData : ObservableObject {
    @Published var name : String
    @Published var weeklyIncome: Float
    @Published var purchases: [Purchase]
    @Published var progressValue : Float
    @Published var offers : [Offer]
    @Published var currentColor : Color {
        didSet {
            objectWillChange.send()
        }
    }
    init(name:String, weeklyIncome: Float, purchases: [Purchase], progressValue : Float){
        self.name = name
        self.weeklyIncome = weeklyIncome
        self.purchases = purchases
        self.progressValue = 0
        self.currentColor = .green
        self.offers = []
    }
    
    
    func todayPurchases() -> [Purchase]{
        var todayPurchases : [Purchase] = []
        /// uD.puchases are a list of all of the purchases
        for p in self.purchases {
            if Calendar.current.isDateInToday(p.date) {
                todayPurchases.append(p)
            }
        }
        
        return todayPurchases
    }
    
    func calculateDailyBalance() -> Float {
        return 0.8  * (self.weeklyIncome / 7)
    }
    
    func moneySpentToday() -> Double {
        var total : Double = 0.00
        
        for p in self.todayPurchases() {
            total += p.price
        }
        
        return total
    }
}
