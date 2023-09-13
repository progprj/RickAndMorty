//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/12.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
