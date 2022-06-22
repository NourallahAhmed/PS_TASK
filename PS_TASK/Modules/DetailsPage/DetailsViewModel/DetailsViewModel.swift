//
//  DetailsViewModel.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation


protocol CustomizedVMProtocol {
    func getCustomizeProduct(comoboID : String)
}
class DetailsViewModel : ObservableObject , CustomizedVMProtocol {
  
    @Published var ComboList : ComboResults?
    @Published var ComboSize : Sizes?

    var CustomizedProductNetwork : ComboAPIProtocol = NetworkAPI()
    
    func getCustomizeProduct(comoboID: String) {
        CustomizedProductNetwork.getComboDetails(Comboid: comoboID) { result in
            self.ComboList = try? result.get()?.ComboResults
            self.ComboSize = try? result.get()?.ComboResults?.Sizes 
            print(result)
        }
    }
    
}
