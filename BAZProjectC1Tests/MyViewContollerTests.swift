//
//  MyViewContollerTests.swift
//  BAZProjectC1
//
//  Created by Michel Torres Alonso on 28/09/22.
//

import XCTest
@testable import BAZProjectC1

/// File manager stub to override the methods we need
class FileManagerStub: AppFileManager {
    func contents(atPath: String) -> Data? {
        if atPath.isEmpty {
            return nil
        } else if atPath == "EmptyFile" {
            return Data()
        } else {
            return Data(atPath.utf8)
        }
    }
}


final class MyViewContollerTests: XCTestCase {
    
    func testLoadContent_withEmptyFile() {
        // Given
        let vc = MyViewController()
        let fileManagerStub = FileManagerStub()
        let decoder: JSONDecoder = JSONDecoder()
        
        // When
        try? vc.loadContent(fileManager: fileManagerStub, path: "EmptyFile", jsonDecoder: decoder)
        
        // Then
        XCTAssertTrue(vc.content.isEmpty)
    }
    
    func testLoadContent_withFileWithMovies() {
        // Given
        let vc = MyViewController()
        let fileManagerStub = FileManagerStub()
        let decoder: JSONDecoder = JSONDecoder()
        let json = """
        [
            {
                "id": 718930,
                "title": "Bullet Train",
                "poster_path": "/ybSIUt48PsM08F4UZwHdjL9ZVG2.jpg"
            },
            {
                "id": 301502,
                "title": "Rubia (Blonde)",
                "poster_path": "/S0kNmNLwqh0fx7F7nlIl3by8oz.jpg"
            }
        ]
        """
        
        // When
        try? vc.loadContent(fileManager: fileManagerStub, path: json, jsonDecoder: decoder)
        
        // Then
        XCTAssertEqual(vc.content.count, 2)
    }
    
    func testLoadContent_withFileWithErrorThrowException() {
        // Given
        let vc = MyViewController()
        let fileManagerStub = FileManagerStub()
        let decoder: JSONDecoder = JSONDecoder()
        
        XCTAssertThrowsError(
            // When
            try vc.loadContent(fileManager: fileManagerStub, path: "", jsonDecoder: decoder)
        ) { error in
            // Then
            XCTAssertEqual(error as! FileError, FileError.emptyPath)
        }
    }
}
