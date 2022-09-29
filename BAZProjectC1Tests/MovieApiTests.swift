//
//  MovieApiTests.swift
//  BAZProjectC1Tests
//
//  Created by Heber Raziel Alvarez Ruedas on 28/09/22.
//

import XCTest
@testable import BAZProjectC1

class MovieAPITests: XCTestCase {
    
    var sut: MovieAPI!
    var session: SessionStub!
    
    override func setUp() {
        super.setUp()
        session = SessionStub()
        sut = MovieAPI(session: session)
    }
    
    override func tearDown() {
        sut = nil
        session = nil
        super.tearDown()
    }
    
    func test_noDataError() {
        // Given
        let expectation = expectation(description: "movies expectation")
        var response = false
        
        // When
        sut.getMovies(completion: { result in
            response = true
            expectation.fulfill()
        })
        // Then
        wait(for: [expectation], timeout: 3.0)
        XCTAssertTrue(response)
    }
    
    func testResponseWithError() {
        // Given
        let expectation = expectation(description: "movies expectation")
        var expectedError: MovieApiError?
        session.error = MovieApiError.parsingData
        
        // When
        sut.getMovies { result in
            switch result {
            case .failure(let error):
                expectedError = error as? MovieApiError
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 3.0)
        XCTAssertNotNil(expectedError)
    }
    
    func test_responseWithParsingError() throws {
        // Given
        let expectation = expectation(description: "movies expectation")
        var expectedError: MovieApiError?
        session.data = Data()
        
        // When
        sut.getMovies { result in
            switch result {
            case .failure(let error):
                expectedError = error as? MovieApiError
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 3.0)
        let unwrappedError = try XCTUnwrap(expectedError)
        XCTAssertEqual(unwrappedError, .parsingData)
    }
}
