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
    var saucesList = [Sauces]()
    var saucesSet = Set<Sauces> ()
    var sectionHeight = 360.0
    @State var IsSelected : String?
    @State var IsReset : Bool = false
    var visiabilityCondition : ViewVisibility = .gone
    @ObservedObject var detailsViewModel  = DetailsViewModel()
    
    
    
    init(comboID: Int){
        self.comboID = comboID
        self.detailsViewModel.getCustomizeProduct(comoboID: String(comboID))
        saucesSet = Set(detailsViewModel.ComboList?.Sauces  ?? [])
        saucesList = Array(saucesSet)

//        if detailsViewModel.ComboList?.ChickenPieces?.isEmpty == true {
//            print("ENTER")
//            visiabilityCondition = .gone
//        }

    }
    var body : some View{
        VStack{
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
                        .frame(width: 130, height: 130)
                        .padding(.top)
                    Spacer()
                    Text(self.detailsViewModel.ComboList?.Name ?? "nil")

                        .padding(.bottom)
                    Text("Customize")
                        .padding(.bottom)
                      
                }
            
            }
            
            //MARK: PART 2 : Combo_Size
            
            HStack{
                    Text("Size").bold()
                        .padding()
                
                ForEach (detailsViewModel.ComboList?.Sizes ?? [] ,id: \.id) { item in
                    VStack{
                        //MARK: Image
                        
                        
                        VStack{
                         
                            Spacer()
                            KFImage(URL(string:  self.detailsViewModel.ComboList?.ImagePath ?? ""))
                                .placeholder { Image("default").frame(width: 50, height: 50) }
                                .resizable()
                                .background(IsSelected == item.Name ? Color.orange : Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                                .padding(2)
                                .onTapGesture {
                                    print("\(item.Name)")
                                        IsSelected = item.Name
                                }
                        }.shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                            .padding(2)
                           
                        Spacer()
                        Text( item.Name ?? "nil")
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width / 3, height: 200)
                }
                
                Spacer()
            }.background(Color.white)
            
            .frame(width: UIScreen.main.bounds.width, height: 200)
//            .border(Color.gray, width: 4)

            
            //MARK: PART 3 : ChickenPieces
                VStack{
                    Text("ChickenPieces").bold().padding() //.visibility(self.visiabilityCondition)

                    QGrid(Array(Set(detailsViewModel.ComboList?.ChickenPieces ?? [])), columns: 2) {

                        GridCell2(newResult: $0, IsReset: self.$IsReset)

                    }//.visibility(self.visiabilityCondition)
                }
              
                .frame(width: UIScreen.main.bounds.width, height: self.sectionHeight)
//                .border(Color.gray ,width: 4)
            
            
            //MARK: PART 4 :  Sauces

            ScrollView{
                VStack{
                    Text("Sauces").bold().padding()

                    QGrid(detailsViewModel.ComboList?.Sauces ?? [], columns: 2) {

                   GridCell2(newResult: $0 , IsReset: self.$IsReset)

                    }
                }.frame(width: UIScreen.main.bounds.width, height: self.sectionHeight)
//                    .border(Color.gray , width: 4)
                    
            }
            
    
            
            //MARK: PART 5 :  Drinks

            ScrollView{
                VStack{
                    Text("Drinks").bold().padding()

                    QGrid(detailsViewModel.ComboList?.Drinks ?? [], columns: 3) {

                    OnePickGridCell2(newResult: $0)

                    }
                }.frame(width: UIScreen.main.bounds.width, height: self.sectionHeight + 30 )
//                    .border(Color.gray , width: 4)

            }
            ScrollView{
                VStack{
                    Text("Sides").bold().padding()
                    QGrid(detailsViewModel.ComboList?.Sides ?? [], columns: 3) {

                    OnePickGridCell2(newResult: $0)

                    }
                }.frame(width: UIScreen.main.bounds.width, height: self.sectionHeight)
//                    .border(Color.gray ,width: 4)

            }
          
        }
            Section{
            Button(action: {
                print("pressed")
            }) {
                
                Text("Add To Cart")
                    .font(Font.headline)
                    .bold()
                    .frame(maxWidth: .infinity)
                    
            }.frame(height:25)
            .foregroundColor(.white)
            .background(Color.blue)
            .frame(maxWidth: .infinity)
            }
        }.toolbar(content: {
            Button(){
                print("clicked")
                self.IsReset = true
            } label: {
                Text("Reset")
                
            }
        })
 
    }
}



//MARK: GridCell
struct GridCell2: View {
    var newResult : ComboComponent
    @Binding var IsReset : Bool 
    @State var counter = 0
    var body: some View {
    VStack() {
        VStack{
       //MARK: IMAGE
        KFImage(URL(string: newResult.ImagePath ?? ""))
        
        .placeholder { Image("default").frame(width: 50, height: 50)}

        .resizable()
        .scaledToFit()
        .padding([.horizontal, .top], 7)
        } .aspectRatio(contentMode: .fit)
            .shadow(color: .primary, radius: 3)
            .padding(.top)
       
        //MARK: NAME
        Text(newResult.Name ?? "nil" )
            .font(Font.headline)
        Spacer()
        HStack{
        //MARK: Stepper
        //MARK: Increment
          
        
        //MARK: deincrement
            Button(action: {
                if counter != 0{
                counter -= 1
                }
                
            }) {
                Text("-").padding()
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        Text("\(counter)")

        Button(action: {
            counter += 1
            
        }) {
            Text("+").padding()
                
        }.frame(height:30)
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(5)
        }  .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
            .padding(2)
        
        }.padding()
//        if IsReset {
//            self.counter = 0 
//        }

    }
        
  }

//MARK: SizeGridCell
struct SizeGridCell2: View {
    var newResult : Sizes
    @State var counter = 0
    var body: some View {
    VStack() {
        VStack{

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
                Text("+").padding()
                    
            }.frame(height:30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        Text("\(counter)")
        
        //MARK: deincrement
            Button(action: {
                counter -= 1
                
            }) {
                Text("-").padding()
                    
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
}



//MARK: OnePickGridCell2
struct OnePickGridCell2: View {
    var newResult : ComboComponent
    @State var counter = 0
    @State var Picked = false
    var body: some View {
    VStack{
        VStack{
       //MARK: IMAGE
        KFImage(URL(string: newResult.ImagePath ?? ""))
        
        //        .placeholder { Image("default").frame(width: 30, height: 30)}

        .resizable()
        .scaledToFit()
        .padding([.horizontal, .top], 7)
        } .aspectRatio(contentMode: .fit)
            .shadow(color: .primary, radius: 3)
            .padding(.top)
       
        //MARK: NAME
        Text(newResult.Name ?? "nil" )
            .font(Font.headline)
        Spacer()
        HStack{
        //MARK: Picker
            Button(action: {
               if self.Picked {
                   self.Picked = false
               }else{
                   self.Picked = true
               }
            }) {
//                if self.Picked {
                Circle().foregroundColor(self.Picked ? Color.orange : Color.white)
                        .frame(width: 25, height: 25)
                        .padding(2)
                        .border(Color.black)

//                }else{
//                    Circle()
//                        .background(Color.white)
//                        .frame(width: 25, height: 25)
//                        .padding(2)
//
//                }
            }.frame(height:30)
          
  
    }
    }
  }
}
extension View {
  @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
    if visibility != .gone {
      if visibility == .visible {
        self
      } else {
        hidden()
      }
    }
  }
}
enum ViewVisibility: CaseIterable {
  case visible, // view is fully visible
       invisible, // view is hidden but takes up space
       gone // view is fully removed from the view hierarchy
}
/*
 Button(action:{
     print("\(item.Name)")
     if IsSelected ?? false {
       IsSelected = false
     }else{
       IsSelected = true
     }
 }{
 KFImage(URL(string:  self.detailsViewModel.ComboList?.ImagePath ?? ""))
     .placeholder { Image("default").frame(width: 50, height: 50) }
     .resizable()
    
     
 } .background(IsSelected ?? false ? Color.orange : Color.white)
     .cornerRadius(16)
     .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
     .padding(2)
 */
