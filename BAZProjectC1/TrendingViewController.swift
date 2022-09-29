//
//  TrendingViewController.swift
//  BAZProjectC1
//
//

import UIKit

class TrendingViewController: UITableViewController {

    var movies: [Movie] = []
    var movieApi: MovieAPIProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeApi()
        fillTableView()
    }
    
    func fillTableView() {
        movieApi?.getMovies { moviesResult in
            switch moviesResult {
            case .success(let moviesData):
                self.guaranteeMainThred {
                    self.movies = moviesData.results
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    private func initializeApi() {
        self.movieApi = MovieAPI(session: .shared)
    }
    
    private func guaranteeMainThred(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}

// MARK: - TableView's DataSource

extension TrendingViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell")
        else { return UITableViewCell() }
        return cell
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
