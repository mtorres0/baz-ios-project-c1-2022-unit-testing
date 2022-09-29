//
//  BAZProjectC1Tests.swift
//  BAZProjectC1Tests
//
//  Created by Michel Torres Alonso on 28/09/22.
//

import XCTest
@testable import BAZProjectC1

final class MovieTableViewTests: XCTestCase {

    let movies = [
        Movie(id: 1, title: "Toy Story", poster_path: ""),
        Movie(id: 2, title: "Cars", poster_path: "")
    ]
    
    private var dataSource: MovieTableViewDataSource!
    private var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        tableView = nil
        dataSource = nil
        super.tearDown()
    }

    func test_tableViewDataSource_verifyNumberOfRowsAndNumberOfSections() {
        //Given
        dataSource = MovieTableViewDataSource(movies: movies)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tableView.dataSource = dataSource
        
        //When
        tableView.reloadData()
        
        //Then
        XCTAssertEqual(tableView.numberOfSections, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func test_tableViewDataSource_verifyCellTitleIsCorrect() {
        //Given
        dataSource = MovieTableViewDataSource(movies: movies)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.dataSource = dataSource
        
        //When
        tableView.reloadData()
        
        //Then
        let cell1 = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieTableViewCell
        XCTAssertEqual(cell1.titleLabel.text, "Toy Story")
        XCTAssertEqual(cell1.identifierLabel.text, "1")
        
        
        let cell2 = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MovieTableViewCell
        XCTAssertEqual(cell2.titleLabel.text, "Cars")
        XCTAssertEqual(cell2.identifierLabel.text, "2")
    }
    
}
