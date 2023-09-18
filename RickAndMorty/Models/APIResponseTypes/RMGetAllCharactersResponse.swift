//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/19.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
    
}
