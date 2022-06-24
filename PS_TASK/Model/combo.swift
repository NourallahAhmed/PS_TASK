//
//  combo.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
struct Combo: Codable {

    let RequestDate: String?
    let ResonseCode: Int?
    let ResonseTitle: String?
    let ResonseMessage: String?
    let ComboResults: ComboResults?
    
    
    private enum CodingKeys: String, CodingKey {
        case RequestDate = "RequestDate"
        case ResonseCode = "ResonseCode"
        case ResonseTitle = "ResonseTitle"
        case ResonseMessage = "ResonseMessage"
        case ComboResults = "Results"
    }

}
struct ComboResults: Codable {

    let ID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Int?
    let ItemType: Int?
    let Calories: String?
    let Sizes: [Sizes]?
    let Drinks: [Drinks]?
    let Sides: [Sides]?
//    let Desserts: [Any]?
    let Sandwiches: [Sandwiches]?
    let ChickenPieces: [ChickenPieces]?
    let Biscuits: [Biscuits]?
    let Sauces: [Sauces]?
    let IsCustomizeable: Bool?
}

protocol ComboComponent {
    var id: Int? { get }
    var ProductID: Int? { get }
    var Name: String? { get }
    var Description: String? { get }
    var ImagePath: String? { get }
//    var DefaultPrice: Int? { get }
    var IsDefault: Bool? { get }
    var ItemType: Int? { get }
    var DisplayOrder: Int? { get }
    var IsSpicy: Bool? { get }
    var IsLTO: Bool? { get }
    var LTOName: String? { get }
    var Size: Int? { get }
    var QuantityMax: Int? { get }
    var QuantityDefault: Int? { get }
    var Ingredients: [Ingredients]? { get }

}
struct Biscuits: Codable , Identifiable , ComboComponent{
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



struct Sides: Codable  , ComboComponent , Identifiable{
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
struct ChickenPieces: Codable , Identifiable , ComboComponent , Hashable{
    
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
struct Sizes: Codable  , Identifiable  {
    let id: Int?
    let Name: String?
    let DefaultPrice: Double?
    let DisplayOrder: Int?
    let IsDefault: Bool?
    let DrinksQuantityMax: Int?
    let DrinksQuantityDefault: Int?
    let SidesQuantityMax: Int?
    let SidesQuantityDefault: Int?
    let DessertsQuantityMax: Int?
    let DessertsQuantityDefault: Int?
    let SandwishsQuantityMax: Int?
    let SandwishsQuantityDefault: Int?
    let ChickenPiecesQuantityMax: Int?
    let ChickenPiecesQuantityDefault: Int?
    let BiscuitsQuantityMax: Int?
    let BiscuitsQuantityDefault: Int?
    let SaucesQuantityMax: Int?
    let SaucesQuantityDefault: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case Name = "Name"
        case DefaultPrice = "DefaultPrice"
        case DisplayOrder = "DisplayOrder"
        case IsDefault = "IsDefault"
        case DrinksQuantityMax = "DrinksQuantityMax"
        case DrinksQuantityDefault = "DrinksQuantityDefault"
        case SidesQuantityMax = "SidesQuantityMax"
        case SidesQuantityDefault = "SidesQuantityDefault"
        case DessertsQuantityMax = "DessertsQuantityMax"
        case DessertsQuantityDefault = "DessertsQuantityDefault"
        case SandwishsQuantityMax = "SandwishsQuantityMax"
        case SandwishsQuantityDefault = "SandwishsQuantityDefault"
        case ChickenPiecesQuantityMax = "ChickenPiecesQuantityMax"
        case ChickenPiecesQuantityDefault = "ChickenPiecesQuantityDefault"
        case BiscuitsQuantityMax = "BiscuitsQuantityMax"
        case BiscuitsQuantityDefault = "BiscuitsQuantityDefault"
        case SaucesQuantityMax = "SaucesQuantityMax"
        case SaucesQuantityDefault = "SaucesQuantityDefault"
    }

}


struct Drinks: Codable  , Identifiable , ComboComponent{
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
struct Sandwiches: Codable, Identifiable , ComboComponent{
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
