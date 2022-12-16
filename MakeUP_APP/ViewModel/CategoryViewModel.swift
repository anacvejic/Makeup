//
//  CategoryViewModel.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 16.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import Foundation
import SwiftUI

final class CategoryViewModel : ObservableObject{
    
    @Published var category : [CategoryModel] = []
    @Published var getresult = [CategoryModel]()
    @Published var load = true
    
    func fetchData(nameOfBrand: String){
        
        UITableView.appearance().separatorStyle = .none
        var data = [CategoryModel]()
        
        self.getCategory { result in
            
            DispatchQueue.main.async {
                for re in result{
                    if re.brand! == nameOfBrand{
                        data.append(re)
                    }
                }
                
                self.category = data.compactMap({$0.category != nil ? $0 : nil}).sorted { (lhs, rhs) -> Bool in
                    self.load = false
                    return lhs.category!.compare(rhs.category!) == ComparisonResult.orderedAscending
                }
                
                self.load = false
            }
        }
    }
    
    
    func getCategory(completion: @escaping(([CategoryModel]) -> ())){
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json") else{
            print("Invalid URL!")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data{
                if let response = try? JSONDecoder().decode([CategoryModel].self, from: data){
                    DispatchQueue.main.async {
                        
                        self.getresult = response
                        completion(self.getresult.compactMap({$0.brand != nil ? $0 : nil}))
                        
                    }
                }
            }
            
        }.resume()
    }
}
