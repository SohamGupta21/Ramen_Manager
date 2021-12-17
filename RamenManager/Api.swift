//
//  Api.swift
//  RamenManager
//
//  Created by soham gupta on 12/16/21.
//

import Foundation

struct Result: Codable{
    var result: Bool
    var offers : [Offer]
}

struct Offer : Codable{
    var lmd_id : String
    var store : String
    var merchant_homepage : String
    var offer_text : String
    var offer_value : String
    var title : String
    var description : String
    var url : String
    var image_url : String
}

class Api : ObservableObject{
    @Published var offers = [Offer]()
    
    func loadData(completion:@escaping ([Offer]) -> ()) {
        guard let url = URL(string: "http://feed.linkmydeals.com/getOffers/?API_KEY=8cd0c17a42efd851c28c9782060e5e03&&format=json") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            var res : Result = try! JSONDecoder().decode(Result.self, from: data!)
          //  print(res)
            let offers = res.offers
            print(offers)
            DispatchQueue.main.async {
                completion(offers)
            }
        }.resume()
        
    }
}
