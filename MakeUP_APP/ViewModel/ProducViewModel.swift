//
//  ProducViewModel.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 16.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import Foundation
import SwiftUI

final class ProducViewModel : ObservableObject{
    
    @Published var product : [ProductModel] = []
    @Published var getResult : [ProductModel] = []
    @Published var load = true
    
    func getData(nameOfBrand: String, nameOfCategory: String){
        
        UITableView.appearance().separatorStyle = .none
        
        var data = [ProductModel]()
        self.fetchData { result in
            for re in result{
                if  re.brand! == nameOfBrand && re.category == nameOfCategory{
                    data.append(re)
                    
                }
            }
            
            self.getResult = data.compactMap({$0.image_link != nil ? $0 : nil}).sorted { (lhs, rhs) -> Bool in
                return lhs.image_link!.compare(rhs.image_link!) == ComparisonResult.orderedAscending
            }
            
            self.load = false
        }
    }
    
    func fetchData(completion: @escaping(([ProductModel]) -> ())){
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json") else{
            print("Invalid URL!")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data{
                if let response = try? JSONDecoder().decode([ProductModel].self, from: data){
                    DispatchQueue.main.async {
                        
                        self.product = response
                        
                        completion(self.product.compactMap({$0.brand != nil ? $0 : nil}))
                    }
                }
            }
            
        }.resume()
    }
    
}
