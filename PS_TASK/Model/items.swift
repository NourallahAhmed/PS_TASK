//
//  items.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
struct Items: Codable {

    let RequestDate: String?
    let ResonseCode: Int?
    let ResonseTitle: String?
    let ResonseMessage: String?
    let itemsResults: [ItemsResults]?

    private enum CodingKeys: String, CodingKey {
        case RequestDate = "RequestDate"
        case ResonseCode = "ResonseCode"
        case ResonseTitle = "ResonseTitle"
        case ResonseMessage = "ResonseMessage"
        case itemsResults = "Results"
    }
}

struct ItemsResults : Codable {
    
    let ID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DefaultPrice: Double?
    let ComboDefaultPrice: Double?
    let ItemType: Int?
    let DisplayOrder: Int?
    let IsSpicy: Bool?
    let IsLto: Bool?
    let LTOName: String?
    let HaveACombo: Bool?
    let HaveSizes: Bool?
    let IsOnlyACombo: Bool?
    let ComboID: Int?
    let Calories: String?
    let IsFavorite: Bool?
    let IsCustomizeable: Bool?
}
