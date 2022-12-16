//
//  CosmeticView.swift
//  MakeUP_APP
//
//  Created by anacvejic on 12/5/22.
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct CosmeticView: View {
    
    @State var nameOfBrand: String
    @ObservedObject private var result = CategoryViewModel()
    
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
                
                VStack(alignment: .center){
                    
                    List{
                        
                        ForEach(result.category.uniqueCategory(), id: \.id){ item in
                            
                            CategoryCell(cat: item)
                        }
                        
                    }.navigationBarTitle("CATEGORY \(nameOfBrand.uppercased())", displayMode: .inline)
                        .opacity(0.5)
                        .multilineTextAlignment(.center)
                        .background(Image("img2").resizable().edgesIgnoringSafeArea(.all))
                        .cornerRadius(20)
                    
                }.padding([.top, .horizontal, .bottom])
            }
        }.onAppear{
            self.result.fetchData(nameOfBrand: nameOfBrand)
        }
        
    }
}



