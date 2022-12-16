//
//  BrandModel.swift
//  MakeUP_APP
//
//  Created by anacvejic on 12/5/22.
//  Copyright © 2022 anacvejic. All rights reserved.
//

import Foundation

struct BrandModel : Codable, Identifiable, Equatable{
    var id: Int
    var brand: String?
    
    static func == (lhs: BrandModel, rhs: BrandModel) -> Bool{
        return lhs.brand == rhs.brand
    }
    
}


extension Sequence where Iterator.Element: Equatable{
    func unique() -> [Iterator.Element]{
        return reduce([], {collection, element in collection.contains(element) ? collection : collection + [element]})
    }
}
