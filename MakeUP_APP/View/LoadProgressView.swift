//
//  LoadProgressView.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 16.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct LoadProgressView: View {
    
    @State var animated = false
    
    var body: some View {
        VStack{
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.red, .orange]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 35, height: 35)
                .rotationEffect(.init(degrees: self.animated ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            
            Text("Please wait.....")
                .padding(.top)
                .foregroundColor(Color.red)
                .font(Font.body.bold())
            
        }.padding(30)
            .background(Color.gray.opacity(0.70))
            .cornerRadius(15)
            .onAppear{
                self.animated.toggle()
            }
    }
}

struct LoadProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LoadProgressView()
    }
}
