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
                "AccessToken":"02111C42A8CC4BF0ACF016AE3E0DEA6C035FBF8A1AAD41BCBE312B1363393A3774511FB8BD6B487BABDF70C9C91A93E1D0A43D499A4E49D4B23226812B2589C19BBF2AF4D81C45E5A2FD3A1319AE676532ABDEDEED9C41FF844A6960FC09CF189E25A0BD1CEA419FA5188E666F89516D9C04C0548DF145E59A64E788991CC765" ,
                "RequestSource":"IOS"
            ]
        }
    }
    

}
