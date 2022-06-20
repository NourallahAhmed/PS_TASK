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

struct Ingredients: Codable {

    let ID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Double?
    let DisplayOrder: Int?
    let QuantityMax: Int?
    let QuantityDefault: Int?
}

struct Sauces: Codable {

    let ID: Int?
    let ProductID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Double?
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
