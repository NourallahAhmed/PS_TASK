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

struct Results: Codable {

    let ID: Int?
    let Name: String?
    let Description: String?
    let ImagePath: String?
    let DisplayOrder: Int?
}
