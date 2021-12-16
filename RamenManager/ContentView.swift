//
//  ContentView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userData = UserData(name:"Soham", weeklyIncome: 12.12, purchases: [Purchase(description: "Bananas", date: Date(), price: 0.11)], progressValue: 0.45)
    var body: some View {
        TabView {
            HomeView(userData: self.userData)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CouponsView()
                .tabItem {
                    Label("Coupons", systemImage: "cart.fill")
                }
            LogView()
                .tabItem {
                    Label("History", systemImage: "book.closed.fill")
                }
            SettingsView(userData: userData)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
