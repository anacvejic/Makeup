//
//  ProductCell.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 16.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct ProductCell: View {
    
    @State var pr : ProductModel
    
    var body: some View {
        NavigationLink(destination: DetailsOfProductView(link: pr.product_link!, img: pr.image_link!, name: pr.name!, price: pr.price!, description: pr.description!)){
            VStack(spacing: 5){
                Spacer()
                Image(uiImage: (pr.getImageFromURL() ?? UIImage(named: "noImage"))!)
                    .resizable()
                    .padding()
                    .shadow(radius: 20)
                    .frame(width: 140, height: 160)
                    .border(Color.gray)
                
                Spacer()
                Text(pr.name!.uppercased())
                    .font(Font.body.bold())
                HStack{
                    Text("\(pr.brand!.uppercased())  \(pr.category!.uppercased())")
                        .padding([.trailing, .leading, .bottom])
                    
                    Spacer(minLength: 0)
                    
                    Text("$\(pr.price!)")
                        .padding([.trailing, .leading, .bottom])
                }
                
            }.background(Color.gray.opacity(0.3))
                .cornerRadius(20)
                .padding([.top, .bottom, .trailing, .leading])
                .shadow(radius: 50)
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(pr: .init(id: 0, category: "Lipstick", brand: "Loreal", name: "Lip blam", image_link: "", price: "6.9", product_link: "", description: ""))
    }
}
