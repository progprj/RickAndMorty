//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/14.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
    
    
}
