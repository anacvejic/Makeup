//
//  BrandViewModel.swift
//  MakeUP_APP
//
//  Created by Grupa 1 on 16.12.22..
//  Copyright © 2022 anacvejic. All rights reserved.
//

import Foundation


import Foundation

final class BrandViewModel : ObservableObject{
    
    @Published var brands : [BrandModel] = []
    @Published var load = true
    
    func fetchBrands(){
        
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json") else{
            print("Invalid URL!")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data{
                if let response = try? JSONDecoder().decode([BrandModel].self, from: data){
                    DispatchQueue.main.async {
                        
                        self.brands = response
                        print("\(self.brands)")
                        
                        self.load = false
                    }
                }
            }
        }.resume()
    }
}
