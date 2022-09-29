//
//  MovieAPI.swift
//  BAZProjectC1
//
//

import Foundation

enum MovieApiError: Error {
    case noData
    case parsingData
}

protocol MovieAPIProtocol {
    func getMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void)
}

struct MovieAPI: MovieAPIProtocol {
    var session: URLSession
    func getMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        load(.trendingMovie, completion: completion)
    }
    
    private func load(_ endpoint: Endpoint, completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        let request = endpoint.request
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(MovieApiError.noData))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MoviesResponse.self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(MovieApiError.parsingData))
            }
        }.resume()
    }
}
