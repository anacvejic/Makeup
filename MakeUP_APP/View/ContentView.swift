//
//  ContentView.swift
//  MakeUP_APP
//
//  Created by anacvejic on 12/4/22.
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject private var result = BrandViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                
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
                    
                    VStack(alignment: .center, spacing: 5){
                        
                        List{
                            ForEach(result.brands.compactMap({$0.brand != nil ? $0 : nil }).unique().sorted(by: { (lhs, rhs) in
                                return lhs.brand!.compare(rhs.brand!) == ComparisonResult.orderedAscending
                            }), id: \.id){ item in
                                
                                BrandsCell(brand: item)
                                
                            }
                            
                        }.padding([.top, .horizontal, .bottom])
                        
                    }.navigationBarTitle("BRANDS", displayMode: .inline)
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .background(Image("img"))
                }
                
            }.onAppear(perform: result.fetchBrands)
                .padding([.top, .horizontal, .bottom])
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



