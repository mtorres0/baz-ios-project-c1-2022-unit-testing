//
//  TrendingViewControllerTests.swift
//  BAZProjectC1Tests
//
//  Created by Heber Raziel Alvarez Ruedas on 27/09/22.
//

import XCTest
@testable import BAZProjectC1

class TrendingViewControllerTests: XCTestCase {
    var sut: TrendingViewController?
    var movieApiMock: MovieApiMock!

    override func setUp() {
        super.setUp()
        sut = TrendingViewController()
        movieApiMock = MovieApiMock()
    }

    override func tearDown() {
        sut = nil
        movieApiMock = nil
        super.tearDown()
    }

    func testExample() throws {
        // Given
        let tableView: UITableView = try XCTUnwrap(sut?.tableView)
        // When
        movieApiMock.movies = [Movie(id: 001, title: "movie_1_mock", poster_path: "poster_path_1_mock"),
                               Movie(id: 002, title: "movie_2_mock", poster_path: "poster_path_2_mock")]
        sut?.fillMovies(from: movieApiMock)
        let moviesCount: Int = try XCTUnwrap(sut?.tableView(tableView, numberOfRowsInSection: .zero))
        // Then
        XCTAssertEqual(moviesCount, 2)
    }
    
    func test_cellForRowAtWhenNoMovies_returnsDefaultCell() throws {
        // Given
        let tableView: UITableView = try XCTUnwrap(sut?.tableView)
        // When
        let cell: UITableViewCell = try XCTUnwrap(sut?.tableView(tableView, cellForRowAt: IndexPath(row: .zero, section: .zero)))
        // Then
        XCTAssertNotNil(cell)
    }
    
    func test_cellForRowAtWhenHasMovies_returnsTrendingTableCellInfo() throws {
        // Given
        let tableView: UITableView = try XCTUnwrap(sut?.tableView)
        // When
        movieApiMock.movies = [Movie(id: 001, title: "movie_1_mock", poster_path: "poster_path_1_mock"),
                               Movie(id: 002, title: "movie_2_mock", poster_path: "poster_path_2_mock")]
        sut?.fillMovies(from: movieApiMock)
        let tableCellView: UIView = try XCTUnwrap(tableView.cellForRow(at: IndexPath(row: .zero, section: .zero))?.subviews.last)
        let titleCell: UILabel = try XCTUnwrap(tableCellView.subviews.last as? UILabel)
        // Then
        XCTAssertEqual(titleCell.text, movieApiMock.movies.first?.title)
        XCTAssertNotNil((tableCellView.subviews.first as? UIImageView)?.image)
    }
}
