//
//  CategoryCell.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 16.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct CategoryCell: View {
    
    
    @State var cat : CategoryModel
    
    var body: some View {
        NavigationLink(destination: ProductView(nameOfCategory: cat.category!, nameOfBrand: cat.brand!)){
            Text(cat.category!.uppercased())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding()
                .font(.title)
                .border(Color.orange)
                .background(Color.orange)
                .cornerRadius(20)
            
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(cat: .init(id: 0, brand: "Loreal", category: "Palette"))
    }
}
