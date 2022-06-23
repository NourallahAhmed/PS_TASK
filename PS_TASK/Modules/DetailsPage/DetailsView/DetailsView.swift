//
//  DetailsView.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
import SwiftUI
import Kingfisher
import QGrid

struct DetailsView: View {
    var comboID : Int?
    @ObservedObject var detailsViewModel  = DetailsViewModel()
    init(comboID: Int){
        self.comboID = comboID
        self.detailsViewModel.getCustomizeProduct(comoboID: String(comboID))
    }
    var body : some View{
        ScrollView{
            //MARK: PART 1 : NAME
            Section{
                VStack{
                    Spacer()
                    KFImage(URL(string: self.detailsViewModel.ComboList?.ImagePath ?? "" ))
                        .placeholder { Image("default").frame(width: 50, height: 70) }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .primary, radius: 3)
                        .clipShape(Circle())
                        .frame(width: 90, height: 90)
                        .padding(.top)
                    Spacer()
                    Text(self.detailsViewModel.ComboList?.Name ?? "nil")
                        .padding(.bottom)
                }
            
            }
            
            //MARK: PART 2 : Combo_Size
            /*
            Section{
            LazyHStack(){
                ForEach (detailsViewModel.ComboSize) { item in
                    VStack{
                        
                        //MARK: Image
                        VStack{
                            Spacer()
                            KFImage(URL(string:  self.detailsViewModel.ComboList?.ImagePath ?? ""))
                                .placeholder { Image("default").frame(width: 50, height: 70) }
                                .resizable()
//                                .frame(width: 100, height: 130)
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                                .padding(2)
                                .onTapGesture {
                                    print("\(item.Name)")
                                }
                            
                        }.shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                            .padding(2)
                        Spacer()
                        Text( item.Name ?? "nil")
                        Spacer()
                    }
                }
                Spacer()
            }.background(Color.white)
        }
           */
            //MARK: PART 3 : ChickenPieces

            Section{
                VStack{
                    QGrid(detailsViewModel.ComboList?.ChickenPieces ?? [], columns: 2) {

                        GridCell2(newResult: $0)

                    }
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
            }
            
            
            
            //MARK: PART 4 :  Sauces

            Section{
                VStack{
                    QGrid(detailsViewModel.ComboList?.Sauces ?? [], columns: 2) {

                    GridCell2(newResult: $0)

                    }
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
            }
            
        }
    }
}



//MARK: GridCell
struct GridCell2: View {
    var newResult : ComboComponent 
    @State var counter = 0
    var body: some View {
    VStack() {
        VStack{
       //MARK: IMAGE
        KFImage(URL(string: newResult.ImagePath ?? ""))
        
        .placeholder { Image("default").frame(width: 50, height: 70)}

        .resizable()
        .scaledToFit()
        .padding([.horizontal, .top], 7)
        } .aspectRatio(contentMode: .fit)
            .shadow(color: .primary, radius: 3)
//            .frame(width: 90, height: 90)
            .padding(.top)
       
        //MARK: NAME
        Text(newResult.Name ?? "nil" )
            .font(Font.headline)
        Spacer()
        HStack{
        //MARK: Stepper
        //MARK: Increment
            Button(action: {
                counter += 1
                
            }) {
                Text(" + ").padding()
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        Text("\(counter)")
        
        //MARK: deincrement
            Button(action: {
                counter -= 1
                
            }) {
                Text(" - ").padding()
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        }.padding()
        }  .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
            .padding(2)
    }
        
  }



//MARK: SaucesGridCell
struct SaucesGridCell2: View {
    var newResult : Sauces
    @State var counter = 0
    var body: some View {
    VStack() {
        VStack{
       //MARK: IMAGE
        KFImage(URL(string: newResult.ImagePath ?? ""))
        
        .placeholder { Image("default").frame(width: 50, height: 70)}

        .resizable()
        .scaledToFit()
        .padding([.horizontal, .top], 7)
        } .aspectRatio(contentMode: .fit)
            .shadow(color: .primary, radius: 3)
            .frame(width: 90, height: 90)
            .padding(.top)
       
        //MARK: NAME
        Text(newResult.Name ?? "nil" )
            .font(Font.headline)
        Spacer()
        HStack{
        //MARK: Stepper
        //MARK: Increment
            Button(action: {
                counter += 1
                
            }) {
                Text(" + ").padding()
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        Text("\(counter)")
        
        //MARK: deincrement
            Button(action: {
                counter -= 1
                
            }) {
                Text(" - ").padding()
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        }.padding()
        }  .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
            .padding(2)
    }
        
  }
