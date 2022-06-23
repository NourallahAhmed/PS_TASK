//
//  HomeView.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation

import SwiftUI
import QGrid
import Kingfisher


struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var title = "Home"
    init(){
        self.homeViewModel.getCategory()
       
        homeViewModel.getItems(categoryId: String( homeViewModel.CategoryList.first?.id ?? 0 ) )

        self.title = homeViewModel.CategoryList.first?.Name ?? "home"

    }
    var body: some View {
        if homeViewModel.NetworkState {
    NavigationView{
        VStack {
            ScrollView{
                ScrollView (.horizontal) {
                    LazyHStack( spacing: 15){
                    //MARK: Category
                        ForEach(self.homeViewModel.CategoryList) { item in
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
                                Spacer()
                                Text(item.Name ?? "nil")
                                    .padding(.bottom)
                                
                            }.shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                                .padding(2)
                                .onTapGesture {
                                    print(item.id ?? "nil")
                                    self.title = item.Name ?? "Home"
                                    //TODO: Sending category id to fetch data
                                    homeViewModel.getItems(categoryId: String(item.id ?? 0 ) )
                                }
                        }
                    } // .padding(.bottom)
                }.frame(height: 140)
                .padding([.bottom , .leading ,.trailing])
                ScrollView (.vertical) {
                    //MARK: Items Details
                    VStack{
                        QGrid(homeViewModel.ItemsList, columns: 2) {
                            
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
        }.navigationBarTitle(Text(self.title),displayMode: .inline)
//            .navigationBarTitle {
//                print("clicked")
//            } label: {
//                Image(systemName: "bag.fill")
//            }
    }  .refreshable {
        
        self.homeViewModel.getCategory()
        }

            
        }else{
            VStack {
                KFImage(URL(string: "https://i.pinimg.com/564x/8e/0f/14/8e0f14accd8523a1ea5c8a8b6339a005.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
        }
        
    }
}



//MARK: GridCell
struct GridCell: View {
    var newResult : ItemsResults
    @State var isCustomizable : Bool = false
    @State var isActive : Bool = false
    @State var isActiveNav : Bool = false

    @State var IsCustomColor : Color = Color.blue

  var body: some View {
    VStack() {
        NavigationLink(destination: IngridentsView(ingridentsID: newResult.id!),
                       isActive: self.$isActiveNav) {
            EmptyView() }
        
        HStack{
            Spacer()
            Image(systemName: "star")
                .frame(width:50,height:50)
                .foregroundColor(.yellow)
        }
        KFImage(URL(string: newResult.ImagePath ?? ""))
        
        .placeholder { Image("default").frame(width: 50, height: 70)}

        .resizable()
        .scaledToFit()
        .padding([.horizontal, .top], 7)

        
        Text(newResult.Name ?? "nil" )
            .font(Font.headline)
//
//        MARK: Empty from network
//        Text( "\(newResult.Calories ?? "nil") CAL" )
//            .font(Font.headline)
        
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
        
//        Text("2.4 DB").multilineTextAlignment(.center)
//            .font(Font.headline)
//            .foregroundColor(.red)

        HStack{
            Button(action: {
                if newResult.IsCustomizeable!{
                    self.isCustomizable = true
                    self.isActive.toggle()
                    IsCustomColor = Color.blue

                }else{
                    self.isCustomizable = false
                    IsCustomColor = Color.gray

                }

            }) {
                Text("Customize")
                }
            .background(NavigationLink(destination: DetailsView(comboID: newResult.ComboID ?? 0), isActive: $isActive) { EmptyView() })
            .disabled(self.isCustomizable)
            .frame(height:30)
            .foregroundColor(.white)
            .background(IsCustomColor)
            .cornerRadius(5)
            
        
            Spacer()
            Button(action: {
                print("pressed")
            }) {
                Text("+ Add ")
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        }.padding()
    }.background(Color.white)
          .border(Color.gray)
          .padding(5)
          .frame(height: UIScreen.main.bounds.height / 2 )
          .onTapGesture {
              self.isActiveNav = true
          }
        
}
  }




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
