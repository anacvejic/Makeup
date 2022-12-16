//
//  DetailsOfProductView.swift
//  MakeUP_APP
//
//  Created by anacvejic on 12/8/22.
//  Copyright © 2022 anacvejic. All rights reserved.
//

import SwiftUI

struct DetailsOfProductView: View {
    
    @State var link : String
    @State var img : String
    @State var name : String
    @State var price : String
    @State var description : String
    @State var image : UIImage = UIImage()
    @State private var showAlert = false
    
    var body: some View {
        
        ZStack{
            //Background
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.6))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                ScrollView{
                    
                    Text("\(self.name)")
                        .font(.title)
                        .foregroundColor(Color.black)
                        .shadow(radius: 40)
                    
                    Spacer()
                    Image(uiImage: self.image)
                        .resizable()
                        .shadow(radius: 40)
                        .frame(width: 200, height: 300)
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .onAppear{
                            
                            self.loadImage(for: self.img)
                        }
                    Spacer()
                    Text("Price $\(self.price)").font(.headline)
                    Spacer()
                    Text("Visit website")
                        .foregroundColor(Color.red)
                        .font(Font.body.bold())
                        .onTapGesture {
                            
                            let url = URL(string: self.link)
                            guard let link = url, UIApplication.shared.canOpenURL(link) else {return}
                            UIApplication.shared.open(link)
                        }
                    Spacer()
                    Text("\(self.description)")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .shadow(radius: 30)
                    
                    
                }
                
            }.padding([.top, .bottom, .trailing, .leading])
        }
        
    }
    func loadImage(for urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                if UIImage(data: data) != nil && self.img != ""{
                    self.image = UIImage(data: data) ?? UIImage()
                }else{
                    self.image = UIImage(named: "noImage")!
                }
            }
        }
        task.resume()
    }
    
}

//struct DetailsOfProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsOfProductView()
//    }
//}
