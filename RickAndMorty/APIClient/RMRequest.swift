//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/14.
//

import Foundation

final class RMRequest {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
        
    }
    
    private let endpoint: RMEndpoint
    private let pathComp: Set<String>
    private let queryParams: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComp.isEmpty {
            pathComp.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParams.isEmpty {
            string += "?"
            let argStr = queryParams.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argStr
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint, pathComp: Set<String> = [], queryParams: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComp = pathComp
        self.queryParams = queryParams
    }
    
}







