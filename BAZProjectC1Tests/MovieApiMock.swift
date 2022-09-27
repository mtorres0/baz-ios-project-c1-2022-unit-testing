//
//  MovieApiMock.swift
//  BAZProjectC1Tests
//
//  Created by Heber Raziel Alvarez Ruedas on 27/09/22.
//

import Foundation
@testable import BAZProjectC1

class MovieApiMock: MovieAPIProtocol {
    // MARK: - Properties
    var movies: [Movie] = []
    
    
    func getMovies() -> [Movie] {
        return movies
    }
}
