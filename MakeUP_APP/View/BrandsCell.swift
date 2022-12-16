//
//  BrandsCell.swift
//  MakeUP_APP
//
//  Created by anacvejic on 12/5/22.
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct BrandsCell: View {
    
    @State var brand : BrandModel
    
    
    var body : some View{
        
        NavigationLink(destination: CosmeticView(nameOfBrand: brand.brand!)){
            Text(brand.brand!.uppercased())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding()
                .font(Font.body.bold())
                .border(Color.gray)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
        }
        
    }
}

struct BrandsCell_Previews: PreviewProvider {
    static var previews: some View {
        BrandsCell(brand: .init(id: 0, brand: "Loreal"))
    }
}


