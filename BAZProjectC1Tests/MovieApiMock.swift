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
    var isSuccessful: Bool = true
    var calls: [String] = []
    
    func getMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        let moviesResponse = MoviesResponse(results: movies)
        let result: Result<MoviesResponse, Error> = isSuccessful ? .success(moviesResponse) : .failure(MovieApiError.noData)
        calls.append(#function)
        completion(result)
    }
}
