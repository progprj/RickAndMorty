//
//  RMService.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/14.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
