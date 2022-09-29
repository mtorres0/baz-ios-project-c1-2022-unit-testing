//
//  TrendingViewController.swift
//  BAZProjectC1
//
//

import UIKit

class TrendingViewController: UITableViewController {

    var movies: [Movie] = []
    var dataSource: MovieTableViewDataSource? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        let movieApi = MovieAPI()
        movies = movieApi.getMovies()
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        dataSource = MovieTableViewDataSource(movies: movies)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

}

// MARK: - TableView's Delegate

extension TrendingViewController {

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var config = UIListContentConfiguration.cell()
        config.text = movies[indexPath.row].title
        config.image = UIImage(named: "poster")
        cell.contentConfiguration = config
    }

}
