//
//  CategoryModel.swift
//  MakeUP_APP
//
//  Created by anacvejic on 12/5/22.
//  Copyright © 2022 anacvejic. All rights reserved.
//

import Foundation

struct CategoryModel : Codable, Identifiable, Equatable{
    var id: Int
    var brand: String?
    var category: String?
    
    static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool{
        return lhs.category == rhs.category
    }
    
}


extension Sequence where Iterator.Element: Equatable{
    func uniqueCategory() -> [Iterator.Element]{
        return reduce([], {collection, element in collection.contains(element) ? collection : collection + [element]})
    }
}
