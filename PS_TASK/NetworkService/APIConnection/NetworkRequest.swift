//
//  NetworkRequest.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
import Alamofire

protocol ProductAPIProtocol {

    func getProductsDetails(Productid:String , completion : @escaping (Result <products? , NSError>) -> Void)
  
}
protocol CategoryAPIProtocol {
    func getCategoryDetails(completion : @escaping (Result <Category? , NSError>) -> Void)
}

protocol ItemsAPIProtocol {
    func getItemsDetails(Categoryid:String , completion : @escaping (Result <Items? , NSError>) -> Void)
}

protocol ComboAPIProtocol {
    func getComboDetails(Comboid:String , completion : @escaping (Result <Combo? , NSError>) -> Void)
}

class NetworkAPI: BaseAPI<NetworkRequest> , CategoryAPIProtocol {
 
    func getCategoryDetails(completion: @escaping (Result<Category?, NSError>) -> Void) {
        self.fetchData(target:.getCategories, responseClass: Category.self){ (result) in
            print((result as? Category)?.Results )
            completion(result)
        }
    }
}


extension NetworkAPI : ItemsAPIProtocol {
    func getItemsDetails(Categoryid: String, completion: @escaping (Result<Items?, NSError>) -> Void) {
        self.fetchData(target:.getItems(CategoryID: Categoryid), responseClass: Items.self){ (result) in
            print((result as? Items)?.itemsResults )
            completion(result)
        }
    }
}

extension NetworkAPI : ProductAPIProtocol{
    func getProductsDetails(Productid: String, completion: @escaping (Result<products?, NSError>) -> Void) {
        self.fetchData(target:.getProducts(productID: Productid), responseClass: products.self){ (result) in
            print((result as? products)?.ProductsResults )
            completion(result)
        }
    }
}


extension NetworkAPI : ComboAPIProtocol {
    func getComboDetails(Comboid: String, completion: @escaping (Result<Combo?, NSError>) -> Void) {
        self.fetchData(target:.getCombo(comboId: Comboid), responseClass: Combo.self){ (result) in
            print((result as? Combo)?.ComboResults )
            completion(result)
        }
    }
    
    
}
