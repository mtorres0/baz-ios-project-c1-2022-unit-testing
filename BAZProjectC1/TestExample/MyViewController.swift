//
//  MyViewController.swift
//  BAZProjectC1
//
//  Created by Michel Torres Alonso on 28/09/22.
//

import UIKit

enum FileError: Error {
    case emptyPath
    case unknown
}

final class MyViewController: UIViewController {
    
    var content: [Movie] = []
    
    func loadContent(fileManager: AppFileManager, path: String, jsonDecoder: JSONDecoder = JSONDecoder()) throws {
        guard let data = fileManager.contents(atPath: path) else {
            throw FileError.emptyPath
            return
        }
        self.content = try jsonDecoder.decode([Movie].self, from: data)
    }
}
