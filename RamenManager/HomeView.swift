//
//  HomeView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct HomeView: View {
    @State var progressValue: Float = 0.6
    @State var items = ["Cheese - $1", "Milk - $2", "Clothes - $50"]
    var body: some View {
        
        VStack(){
            HStack{
                Text("Today's Balance: $24.32")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {}){
                    Image(systemName: "plus")
                }
                .frame(width: 50, height: 50)
                .font(.title2)
            }
            .padding()
            Spacer()
            ProgressBar(progress: self.$progressValue)
                .frame(width: 150.0, height: 150.0)
                .padding(40.0)
            Spacer()
        
            List {
                Section(header:Text("Today's Purchases")) {
                    ForEach(0 ..< items.count) {
                        Text(self.items[$0])
                    }
                    .listRowBackground(Color.white)
                }
            }.listStyle(.plain)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
