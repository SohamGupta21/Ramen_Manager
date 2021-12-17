//
//  CouponsView.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI


struct CouponsView: View {
    @State private var results : Result = Result(result: false, offers: [])
    @State var offers = [Offer]()
    @State var unusedOffers = [Offer]()
    @State var search = ""
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                HStack{
                    Text("Coupons")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .onAppear() {
                    Api().loadData { (offers) in
                        self.offers = offers
                    }
                }
//                HStack {
//                    TextField("Search", text: $search, onCommit: {
//                        unusedOffers = []
//                        for n in 0..<offers.count {
//                            if !offers[n].store.contains(search) {
//                                unusedOffers.append(offers[n])
//                                offers.remove(at: n)
//                            }
//                        }
//                    })
//                    .padding()
//                }.modifier(customViewModifier(roundedCornes: 6, startColor: .green, endColor: .green, textColor: .white))
                List {
                    Section(header:Text("Offers")) {
                        ForEach(0 ..< offers.count, id: \.self) {offer in
                            CouponCardView(offer: offers[offer])
                        }
                        .listRowBackground(Color.white)
                    }
                }.listStyle(.plain)
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
            if let decodedResponse = try? JSONDecoder().decode(Result.self, from: data) {
                //results = decodedResponse.results
            }
            //print(results.count)
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
