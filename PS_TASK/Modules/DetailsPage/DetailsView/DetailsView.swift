//
//  DetailsView.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct DetailsView: View {
    var comboID : Int
    @ObservedObject var detailsViewModel  = DetailsViewModel()
    init(comboID: Int){
        self.comboID = comboID
        self.detailsViewModel.getCustomizeProduct(comoboID: String(comboID))
    }
    var body : some View{
        ScrollView{
            //MARK: PART 1 : NAME
            VStack{
                Spacer()
                KFImage(URL(string: self.detailsViewModel.ComboList.ImagePath ?? "" ))
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
            
            
            
            //MARK: PART 2 : Combo_Size

            LazyHStack( spacing: 15){

                ForEach (self.detailsViewModel.ComboSize ?? [] ){ item in
                    VStack{
                        //MARK: Image
                        VStack{
                            Spacer()
                            KFImage(URL(string: item.ImagePath ?? "" ))
                                .placeholder { Image("default").frame(width: 50, height: 70) }
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(color: .primary, radius: 3)
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                                .padding(.top)
                            
                        }.shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                            .padding(2)
                        Spacer()
                        Text(item.Name ?? "nil")
                    }
                }
                
            }
            
            
//            VStack{
//                QGrid(homeViewModel.ItemsList, columns: 2) {
//
//                    GridCell2(newResult: $0)
//
//                }
//            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
//
            
        }
        
    }
}
