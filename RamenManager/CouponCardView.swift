//
//  CouponCardView.swift
//  RamenManager
//
//  Created by soham gupta on 12/16/21.
//

import SwiftUI

struct CouponCardView: View {
    @State var offer : Offer
    var body: some View {
        HStack{
//            if #available(iOS 15.0, *) {
//                AsyncImage(url: URL(string: offer.image_url))
//                    .aspectRatio(contentMode: .fit)
//                    .clipped()
//            } else {
//                // Fallback on earlier versions
//            }
            VStack {
                HStack {
                    Text(offer.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text(offer.store)
                    Spacer()
                }
                HStack {
                    Text(offer.description)
                        .font(.caption)
                    Spacer()
                }
                HStack {
                    Link("Link to deal", destination: URL(string: offer.url)!)
                        .foregroundColor(.green)
                        .font(.caption)
                    Spacer()
                }
            }
        }
    }
}

//struct CouponCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CouponCardView()
//    }
//}
