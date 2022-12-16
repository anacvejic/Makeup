//
//  ProductView.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 6.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    
    @State var nameOfCategory : String
    @State var nameOfBrand : String
    
    @ObservedObject private var result = ProducViewModel()
    
    
    var body: some View {
        
        ZStack{
            Color.orange.opacity(0.3).edgesIgnoringSafeArea(.all)
            
            if result.load{
                GeometryReader{_ in
                    
                    VStack(alignment: .center){
                        
                        Spacer()
                        
                        LoadProgressView()
                        
                        Spacer()
                    }.frame(maxWidth: .infinity)
                        .padding()
                    
                }.background(Image("imgLoad")
                                .resizable().opacity(0.9))
                    .edgesIgnoringSafeArea(.all)
                
            }else{
                List{
                    
                    ForEach(result.getResult.compactMap({$0.price != nil ? $0 : nil}), id: \.id){ item in
                        
                        ProductCell(pr: item)
                    }
                }.listRowInsets(.init(top: 0, leading: 25, bottom: 0, trailing: 0))
                
            }
        }.onAppear{
            self.result.getData(nameOfBrand: nameOfBrand, nameOfCategory: nameOfCategory)
        }
    }
    
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView()
//    }
//}
