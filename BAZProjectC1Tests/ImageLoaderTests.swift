//
//  ImageLoaderTests.swift
//  BAZProjectC1
//
//  Created by Michel Torres Alonso on 29/09/22.
//

import XCTest
@testable import BAZProjectC1

final class ImageLoaderTests: XCTestCase {
    
    func testLoadImageFromNetwork_withNotFoundImage() {
        // Given
        let imageUrlString = "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"
        let expectation = XCTestExpectation(description: "get image async")
        
        // When
        ImageLoader().loadFromNetwork(URL(string: imageUrlString)!) { image in
            XCTAssertNil(image)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    
    func testLoadImageFromNetwork_withExistingImage() {
        // Given
        let imageUrlString = "https://image.tmdb.org/t/p/w500/ybSIUt48PsM08F4UZwHdjL9ZVG2.jpg"
        let expectation = XCTestExpectation(description: "get image async")
        
        // When
        ImageLoader().loadFromNetwork(URL(string: imageUrlString)!) { image in
            XCTAssertNotNil(image)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
