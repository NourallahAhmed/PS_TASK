//
//  category.swift
//  PS_TASK
//
//  Created by NourAllah Ahmed on 20/06/2022.
//

import Foundation
struct Category: Codable {

    let RequestDate: String?
    let ResonseCode: Int?
    let ResonseTitle: String?
    let ResonseMessage: String?
    let Results: [Results]?
}

struct Results: Codable, Identifiable {
    
    let id: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DisplayOrder: Int?

    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case Name = "Name"
        case Description = "Description"
        case ImagePath = "ImagePath"
        case DisplayOrder = "DisplayOrder"
    }
    
}
