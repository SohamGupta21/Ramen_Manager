//
//  AddPurchaseView.swift
//  RamenManager
//
//  Created by soham gupta on 12/15/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddPurchaseView: View {
    @Environment(\.dismiss) var dismiss
    @State var description = ""
    @State var price = ""
    @StateObject var userData : UserData
    var body: some View {
        VStack {
            HStack {
                Button("Dismiss") {
                    dismiss()
                }
                .padding()
                Spacer()
            }
            Text("Add a new purchase")
                .font(.title)
            
            HStack {
                TextField("Description", text: $description)
                .padding()
            }.modifier(customViewModifier(roundedCornes: 6, startColor: .green, endColor: .green, textColor: .white))
            
            HStack {
                TextField("Price", text: $price)
                .padding()
            }.modifier(customViewModifier(roundedCornes: 6, startColor: .green, endColor: .green, textColor: .white))
            
            Button(action: {
                userData.purchases.append(Purchase(description: description, date: Date(), price: Double(price) ?? 0))
                userData.progressValue = Float(moneySpentToday(ud: userData)) / Float(calculateDailyBalance(uD: userData))
                
                if userData.progressValue > 0.5 {
                    userData.currentColor = .yellow
                }
                
                if userData.progressValue > 0.75 {
                    userData.currentColor = .red
                }
            }){
                Text("Submit")
            }
            Spacer()
        }
        
    }
}

//
//struct AddPurchaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPurchaseView()
//    }
//}
