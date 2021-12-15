//
//  SettingsView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct SettingsView: View {
    @State var name = ""
    var body: some View {
        VStack{
            Text("Name")
                .font(.title)
            TextField("Name", text: $name)
                .padding()
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
