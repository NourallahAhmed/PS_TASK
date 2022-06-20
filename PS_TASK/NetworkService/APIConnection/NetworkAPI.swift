//
//  NetworkAPI.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
import Alamofire

enum NetworkRequest{
    case getItems(CategoryID : String)
    case getProducts (productID : String)
    case getCombo (comboId: String)
    case getCategories
}

extension NetworkRequest : TargetType {
  
    
    var baseURL: String {
        switch self {
    
        default :
            return "http://txsrv_v5.psdigital.me/api/V5/Order/en/6/Menu/"
        }
    }
    
    
    var path: String {
        switch self {
        
        case .getItems(let CategoryID):
            return "Category/Items?OrderType=2&Category=\(CategoryID)&Branch=0"
        case .getProducts(let productID):
            return "Product?Branch=0&Product=\(productID)"
        case .getCombo( let comboId):
            return "Combo?Branch=0&Combo=\(comboId)"
        case .getCategories:
            return "Category?OrderType=2"
        }
    }
    
    var method: HTTPMethod {
            switch self {
                
            case .getItems:
                return .get
            case .getProducts:
                return .get
                
            case .getCombo:
                return .get
                
            case .getCategories:
                return .get
                
            }
        }
    
        var task: Task {
            switch self {
            case .getItems:
                return .requestPlain
            case .getProducts:
                return   .requestPlain
            case .getCombo:
                return   .requestPlain
            case .getCategories:
                return   .requestPlain
            }
        }
        
    var headers: [String : String]? {
        switch self {
        default:

            return [
                "X-Shopify-Access-Token":"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"
            ]
        }
    }
    

}
