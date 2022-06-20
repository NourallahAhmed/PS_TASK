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
        Results(id: 23, Name:  "WRAPS", Description: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NWrap.png", DisplayOrder: 2),
           Results(id: 23, Name: "CHICKEN MEALS", Description: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NChickenMeals.png", DisplayOrder: 2),
           Results(id: 23, Name: "test", Description: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", ImagePath: "test", DisplayOrder: 2),
           Results(id: 23, Name: "test", Description: "test", ImagePath: "test", DisplayOrder: 2),     Results(id: 23, Name:  "WRAPS", Description: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NWrap.png", DisplayOrder: 2),
        Results(id: 23, Name: "CHICKEN MEALS", Description: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", ImagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NChickenMeals.png", DisplayOrder: 2),
        Results(id: 23, Name: "test", Description: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", ImagePath: "test", DisplayOrder: 2),
        Results(id: 23, Name: "test", Description: "test", ImagePath: "test", DisplayOrder: 2)]
    var body: some View {
        VStack {
            ScrollView{
                ScrollView (.horizontal) {
                    
                    HStack( spacing: 15){
                    
                        ForEach(0 ..< 15) { item in
                            VStack{
                                Spacer()
                                Image(systemName: "cart")
                                    .resizable()
                                    .shadow(color: .primary, radius: 3)
                                    .clipShape(Circle())
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
                    
                    VStack{
                        QGrid(self.dummy, columns: 2) {
                            
                            GridCell(newResult: $0)
                            
                        }
                        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
                               
                }
              
            }
            Section{
            Button(action: {
                print("pressed")
            }) {
                
                Text("Check Out")
                    .font(Font.headline)
                    .bold()
                    .frame(maxWidth: .infinity)
                    
            }.frame(height:25)
            .foregroundColor(.white)
            .background(Color.blue)
            .frame(maxWidth: .infinity)
            }
        }
        
    }
}




struct GridCell: View {
    var newResult :Results

  var body: some View {
    VStack() {
        HStack{
            Spacer()
            Image(systemName: "star")
                .frame(width:50,height:50)
                .foregroundColor(.yellow)
        }
        Image(systemName: "cart")
        .resizable()
        .scaledToFit()
        .padding([.horizontal, .top], 7)

        
        Text(newResult.Name ?? "nil" )
            .font(Font.headline)
            
        
        Text("24 CAL" )
            .font(Font.headline)
        
        Text(newResult.Description ?? "nil").multilineTextAlignment(.center)
            .font(Font.subheadline)
            .foregroundColor(.gray)
        
        HStack{
            Spacer(minLength: 5)
            VStack{
                Circle()
                    .fill(.red)
                    .frame(width: 25, height: 25)
                    .padding(2)
                Text("Sandwish")
            }
            Spacer(minLength: 5)
            VStack{
                Circle()
                    .strokeBorder(.black)
                    .frame(width: 25, height: 25)
                    .padding(2)
                Text("meal")

            }
            Spacer(minLength: 5)
        }
        
        Text("2.4 DB").multilineTextAlignment(.center)
            .font(Font.headline)
            .foregroundColor(.red)

        HStack{
            Button(action: {
                print("pressed")
            }) {
                Text("Customize")
                    
            }
            
            .frame(height:25)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
            
            Button(action: {
                print("pressed")
            }) {
                Text("+ Add ")
                    
            }.frame(height:25)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        }.padding()
    }.background(Color.white)
//          .cornerRadius(16)
//          .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
          .border(Color.gray)
          .padding(5)
          .frame(height: UIScreen.main.bounds.height / 2 )
  }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
