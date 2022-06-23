//
//  products.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation

struct products: Codable {

    let RequestDate: String?
    let ResonseCode: Int?
    let ResonseTitle: String?
    let ResonseMessage: String?
    let ProductsResults: ProductsResults?

    private enum CodingKeys: String, CodingKey {
        case RequestDate = "RequestDate"
        case ResonseCode = "ResonseCode"
        case ResonseTitle = "ResonseTitle"
        case ResonseMessage = "ResonseMessage"
        case ProductsResults = "Results"
    }
}
struct ProductsResults :Codable{
    let ID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Double?
    let ItemType: Int?
    let IsSpicy: Bool?
    let IsLto: Bool?
    let LTOName: String?
    let Calories: String?
    let Sizes: [ProductSizes]?
    let Ingredients: [Ingredients]?
    let IsCustomizeable: Bool?

}

struct ProductSizes: Codable {

    let ID: Int?
    let Name: String?
    let DefaultPrice: Double?
    let IsDefault: Bool?
    let DisplayOrder: Int?
}

struct Ingredients: Codable  , Identifiable{

    let id: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Double?
    let DisplayOrder: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case Name = "Name"
        case Description = "Description"
        case ImagePath = "ImagePath"
        case DefaultPrice = "DefaultPrice"
        case DisplayOrder = "DisplayOrder"
        case QuantityMax = "QuantityMax"
        case QuantityDefault = "QuantityDefault"
    }

}

struct Sauces: Codable , Identifiable , ComboComponent{
    var id: Int?
    
    var ProductID: Int?
    
    var Name: String?
    
    var Description: String?
    
    var ImagePath: String?
    
    var DefaultPrice: Int?
    
    var IsDefault: Bool?
    
    var ItemType: Int?
    
    var DisplayOrder: Int?
    
    var IsSpicy: Bool?
    
    var IsLTO: Bool?
    
    var LTOName: String?
    
    var Size: Int?
    
    var QuantityMax: Int?
    
    var QuantityDefault: Int?
    
    var Ingredients: [Ingredients]?
    

   
    
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case ProductID = "ProductID"
        case Name = "Name"
        case Description = "Description"
        case ImagePath = "ImagePath"
        case DefaultPrice = "DefaultPrice"
        case IsDefault = "IsDefault"
        case ItemType = "ItemType"
        case DisplayOrder = "DisplayOrder"
        case IsSpicy = "IsSpicy"
        case IsLTO = "IsLTO"
        case LTOName = "LTOName"
        case Size = "Size"
        case QuantityMax = "QuantityMax"
        case QuantityDefault = "QuantityDefault"
        case Ingredients = "Ingredients"
    }
}
