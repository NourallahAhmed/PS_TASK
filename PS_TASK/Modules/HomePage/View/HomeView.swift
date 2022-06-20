//
//  HomeView.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation

import SwiftUI
import QGrid

struct HomeView: View {
    
            
    var dummy :[ Results] = [
        Results(id: 23, Name:  "WRAPS", Description: "test", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NWrap.png", DisplayOrder: 2),
           Results(id: 23, Name: "CHICKEN MEALS", Description: "test", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NChickenMeals.png", DisplayOrder: 2),
           Results(id: 23, Name: "test", Description: "test", ImagePath: "test", DisplayOrder: 2),
           Results(id: 23, Name: "test", Description: "test", ImagePath: "test", DisplayOrder: 2),     Results(id: 23, Name:  "WRAPS", Description: "test", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NWrap.png", DisplayOrder: 2),
        Results(id: 23, Name: "CHICKEN MEALS", Description: "test", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NChickenMeals.png", DisplayOrder: 2),
        Results(id: 23, Name: "test", Description: "test", ImagePath: "test", DisplayOrder: 2),
        Results(id: 23, Name: "test", Description: "test", ImagePath: "test", DisplayOrder: 2)]
    var body: some View {
        ScrollView{
            ScrollView (.horizontal) {
                
                HStack( spacing: 20){
                
                    ForEach(0 ..< 15) { item in
                        VStack{
                            Spacer()
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(.top)
                            Spacer()
                            Text("hello").padding(.bottom)
                        }.frame(width: 100, height: 130)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                            .padding(2)
                    }
                }
            }.frame(height: 140)
            .padding([.bottom , .leading ,.trailing])
            Text("Welcome")
            ScrollView (.vertical) {
                
                VStack( spacing: 20){
                
                    ForEach(0 ..< 15) { item in
                        VStack{
                            QGrid(self.dummy, columns: 2) { GridCell(newResult: $0) }
                        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                            .padding(10)
                    }
                }
            }
            .padding([.bottom , .leading ,.trailing])
        }
    }
}




struct GridCell: View {
    var newResult :Results

  var body: some View {
    VStack() {
        Image(newResult.ImagePath ?? "cart.fill")
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .shadow(color: .primary, radius: 5)
        .padding([.horizontal, .top], 7)
        Text(newResult.Name ?? "nil").lineLimit(1)
      Text(newResult.Description ?? "nil").lineLimit(1)
    }
  }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
