//
//  HomeView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var userData : UserData
    @State var addPurchaseSheetShowing = false
    var body: some View {
        VStack(){
            HStack{
                Text("\(userData.name)'s Daily Balance: $\(String(format: "%.2f", (calculateDailyBalance(uD : userData) - Float(moneySpentToday(ud: userData)))))")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {
                    self.addPurchaseSheetShowing.toggle()
                }){
                    Image(systemName: "plus")
                }.sheet(isPresented : $addPurchaseSheetShowing) {
                    if #available(iOS 15.0, *) {
                        AddPurchaseView(userData: userData)
                    }
                }
                .frame(width: 50, height: 50)
                .font(.title2)
            }
            .padding()
            Spacer()
            ProgressBar(userData: userData)
                .frame(width: 150.0, height: 150.0)
                .padding(40.0)
            Spacer()
        
            List {
                Section(header:Text("Today's Purchases")) {
                    ForEach(0 ..< todayPurchases(uD: userData).count, id: \.self) {p in
                        Text("$\(String(format: "%.2f", todayPurchases(uD: userData)[p].price)) - \(todayPurchases(uD: userData)[p].description)")
                    }
                    .listRowBackground(Color.white)
                }
            }.listStyle(.plain)
        }.onAppear(perform: {
            userData.progressValue = Float(moneySpentToday(ud: userData)) / Float(calculateDailyBalance(uD: userData))
        })
    }
}

func todayPurchases(uD : UserData) -> [Purchase]{
    var todayPurchases : [Purchase] = []
    /// uD.puchases are a list of all of the purchases
    for p in uD.purchases {
        if Calendar.current.isDateInToday(p.date) {
            todayPurchases.append(p)
        }
    }
    
    return todayPurchases
}

func calculateDailyBalance(uD : UserData) -> Float {
    return 0.8  * (uD.weeklyIncome / 7)
}

func moneySpentToday(ud : UserData) -> Double {
    let todayPurchases = todayPurchases(uD: ud)
    
    var total : Double = 0.00
    
    for p in todayPurchases {
        total += p.price
    }
    
    return total
}

//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
