//
//  ProductModel.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 6.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import Foundation
import UIKit

struct ProductModel : Codable, Identifiable, Equatable{
    
    var id: Int
    var category: String?
    var brand: String?
    var name : String?
    var image_link : String?
    var price : String?
    var product_link : String?
    var description : String?
    
    
    
    
    func getImageFromURL() -> UIImage? {
        guard let image_link = image_link else {
            return nil
        }

          guard let url = URL(string: image_link) else {
              return nil
          }
          guard let data = try? Data(contentsOf: url) else {
              return nil
          }
          return UIImage(data: data)
      }
}
