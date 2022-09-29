//
//  Endpoint.swift
//  BAZProjectC1
//
//  Created by Heber Raziel Alvarez Ruedas on 28/09/22.
//

import Foundation

enum Endpoint {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let apiKey: String = "f6cd5c1a9e6c6b965fdcab0fa6ddd38a"
    
    case trendingMovie
}

extension Endpoint {
    var string: String {
        switch self {
        case .trendingMovie:
            return "trending/movie/day?api_key=\(Endpoint.apiKey)"
        }
    }
    
    var request: URLRequest {
        switch self {
        case .trendingMovie:
            let url = URL(string: Endpoint.baseURL + string)!
            return URLRequest(url: url)
        }
    }
}
