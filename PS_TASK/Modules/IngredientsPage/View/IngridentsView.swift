//
//  IngridentsView.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 21/06/2022.
//

import SwiftUI
import Kingfisher
struct IngridentsView: View {
    var ingridentsID : Int // [Ingredients]()
    @ObservedObject var ingredientsViewModel = IngredientsViewModel()
    init( ingridentsID : Int ){
        self.ingridentsID = ingridentsID
        self.ingredientsViewModel.getProduct(ProductID: String(ingridentsID))
    }
    var body: some View {
        VStack{
            ScrollView{
            ForEach (ingredientsViewModel.Product?.Ingredients ?? [] ){ item in
                KFImage(URL(string: item.ImagePath ?? ""))
                    .placeholder { Image("default") }
                .resizable()
                .scaledToFit()
                .padding([.horizontal, .top], 7)
                
                Text(item.Name ?? "nil")
                
                Text(" QuantityDefault: \(item.QuantityDefault ?? 0 )")

                Text(" QuantityMax: \(item.QuantityMax ?? 0 )")
                
                Text(" DefaultPrice: \(item.DefaultPrice ?? 0 )")
            }
            }

        }
    }
}

//struct IngridentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngridentsView()
//    }
//}
