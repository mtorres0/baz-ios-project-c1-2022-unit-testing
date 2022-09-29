//
//  AppFileManager.swift
//  BAZProjectC1
//
//  Created by Michel Torres Alonso on 28/09/22.
//

import Foundation

/// Protocol definition for the FileManager
protocol AppFileManager {
    func contents(atPath: String) -> Data?
}
