//
//  Movie.swift
//  BAZProjectC1
//
//

import Foundation

struct MoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int?
    let title: String?
    let poster_path: String?
}
