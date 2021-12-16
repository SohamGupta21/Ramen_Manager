//
//  CouponsView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var result: Bool
}


struct CouponsView: View {
    @State private var results = [Result]()

    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                HStack{
                    Text("Coupons")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                List(results, id: \.result) { item in
                    VStack(alignment: .leading) {
                        Text("hello")
                            .font(.headline)
                    }
                }
                .task {
                    await loadData()
                }
              
//                List {
//                    Section(header: Text("Bananas")) {
//                      Text("Buy one get one Free at Kohls")
//                    }
//                    Section(header: Text("Bananas")) {
//                      Text("Buy one get one Free at Kohls")
//                    }
//                    Section(header: Text("Bananas")) {
//                      Text("Buy one get one Free at Kohls")
//                    }
//                }
            }
           
        }

    }
    
    @available(iOS 15.0.0, *)
    func loadData() async {
        guard let url = URL(string: "http://feed.linkmydeals.com/getOffers/?API_KEY=8cd0c17a42efd851c28c9782060e5e03&&format=json") else {
            print("Invalid URL")
            return
        }
        
        do {
            print("out here")
            let (data, _) = try await URLSession.shared.data(from: url)

            // more code to come
            print(data)
            print("we are getting here!!!")
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            print(results.count)
        } catch {
            print("Invalid data")
        }
      
    }
}

struct CouponsView_Previews: PreviewProvider {
    static var previews: some View {
        CouponsView()
    }
}
