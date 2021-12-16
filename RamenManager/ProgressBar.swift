//
//  ProgressBar.swift
//  RamenManager
//
//  Created by soham gupta on 12/13/21.
//

import SwiftUI

struct ProgressBar: View {
    @StateObject var userData: UserData
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(userData.currentColor)
                .frame(width: 200, height: 200)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(userData.progressValue, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(userData.currentColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
                .frame(width: 200, height: 200)
            Text(String(format: "%.0f %%", min(userData.progressValue, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}
//
//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar(progress: .constant(0.01))
//    }
//}
