//
//  SettingsView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct SettingsView: View {
    @State var name = ""
    @State var weeklyIncome = ""
    @StateObject var userData : UserData
    var body: some View {
        VStack{
            Text("Adjust Settings")
                .font(.title)
            HStack {
                TextField("Name", text: $name, onCommit: {
                    userData.name = self.name
                })
                .padding()
            }.modifier(customViewModifier(roundedCornes: 6, startColor: .green, endColor: .green, textColor: .white))
           
            HStack {
                TextField("Weekly Income", text: $weeklyIncome, onCommit: {
                    userData.weeklyIncome = Float(self.weeklyIncome) ?? 0
                })
                .padding()
            }.modifier(customViewModifier(roundedCornes: 6, startColor: .green, endColor: .green, textColor: .white))
        }
    }
}

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            
            .shadow(radius: 10)
    }
}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
