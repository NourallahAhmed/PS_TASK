//
//  IngredientsViewModel.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 21/06/2022.
//

import Foundation
import Network
protocol ProductVMProtocol{
    func getProduct (ProductID:String)
}
class IngredientsViewModel : ObservableObject , ProductVMProtocol{
    @Published var Product : ProductsResults?
    var NetworkAPiProduct : ProductAPIProtocol = NetworkAPI()

    
    
    //TODO: Internet
    @Published var NetworkState : Bool = true
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    let monitor = NWPathMonitor()
    
    
    func getProduct(ProductID: String) {
        monitor.pathUpdateHandler = { [weak self] pathUpdateHandler  in
           

            if pathUpdateHandler.status == .satisfied {
                DispatchQueue.main.sync {
                    self?.NetworkState = true

                }
                self?.NetworkAPiProduct.getProductsDetails(Productid: ProductID ,completion: { result in
                    self?.Product = try?  result.get()?.ProductsResults
                })
            }
            else{
                DispatchQueue.main.sync {
                    self?.NetworkState = false
                }
            }
        }
        monitor.start(queue: queue)
    }
    
}
