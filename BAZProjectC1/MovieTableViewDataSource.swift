//
//  TableviewDataSource.swift
//  BAZProjectC1
//
//  Created by Michel Torres Alonso on 28/09/22.
//

import UIKit

final class MovieTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = movies[indexPath.row].title
        cell.identifierLabel.text = "\(movies[indexPath.row].id)"
        return cell
    }
}
