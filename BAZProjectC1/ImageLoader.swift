//
//  ImageLoader.swift
//  BAZProjectC1
//
//  Created by Michel Torres Alonso on 29/09/22.
//

import UIKit.UIImage

struct ImageLoader {
    static func loadFromNetwork(_ url: URL, completion: @escaping (UIImage?) -> Void)  {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }
        task.resume()
    }
}
