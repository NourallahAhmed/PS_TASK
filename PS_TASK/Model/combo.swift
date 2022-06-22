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

struct Biscuits: Codable {

    let ID: Int?
    let ProductID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Int?
    let IsDefault: Bool?
    let ItemType: Int?
    let DisplayOrder: Int?
    let IsSpicy: Bool?
    let IsLTO: Bool?
    let LTOName: String?
    let Size: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
    let Ingredients: [Ingredients]?

}



struct Sides: Codable {

    let ID: Int?
    let ProductID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Int?
    let IsDefault: Bool?
    let ItemType: Int?
    let DisplayOrder: Int?
    let IsSpicy: Bool?
    let IsLTO: Bool?
    let LTOName: String?
    let Size: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
    let Ingredients: [Ingredients]?
}
struct ChickenPieces: Codable {

    let ID: Int?
    let ProductID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Int?
    let IsDefault: Bool?
    let ItemType: Int?
    let DisplayOrder: Int?
    let IsSpicy: Bool?
    let IsLTO: Bool?
    let LTOName: String?
    let Size: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
    let Ingredients: [Ingredients]?
}
struct Sizes: Codable  , Identifiable {
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


struct Drinks: Codable {

    let ID: Int?
    let ProductID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Int?
    let IsDefault: Bool?
    let ItemType: Int?
    let DisplayOrder: Int?
    let IsSpicy: Bool?
    let IsLTO: Bool?
    let LTOName: String?
    let Size: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
    let Ingredients: [Ingredients]?
}
struct Sandwiches: Codable {

    let ID: Int?
    let ProductID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Int?
    let IsDefault: Bool?
    let ItemType: Int?
    let DisplayOrder: Int?
    let IsSpicy: Bool?
    let IsLTO: Bool?
    let LTOName: String?
    let Size: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
    let Ingredients: [Ingredients]?
}
