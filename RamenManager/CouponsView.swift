//
//  CouponsView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct CouponsView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                HStack{
                    Text("Coupons")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
              
                List {
                    Section(header: Text("Bananas")) {
                      Text("Buy one get one Free at Kohls")
                    }
                    Section(header: Text("Bananas")) {
                      Text("Buy one get one Free at Kohls")
                    }
                    Section(header: Text("Bananas")) {
                      Text("Buy one get one Free at Kohls")
                    }
                }
            }
           
        }

    }
}

struct CouponsView_Previews: PreviewProvider {
    static var previews: some View {
        CouponsView()
    }
}
