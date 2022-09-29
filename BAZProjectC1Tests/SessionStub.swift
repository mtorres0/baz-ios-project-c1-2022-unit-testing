//
//  SessionStub.swift
//  BAZProjectC1Tests
//
//  Created by Heber Raziel Alvarez Ruedas on 29/09/22.
//

import Foundation

class SessionStub: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        DataTaskStub {
            completionHandler(self.data, self.response, self.error)
        }
    }
}

class DataTaskStub: URLSessionDataTask {
    
    private let closure: () -> ()
    
    init(closure: @escaping () -> ()) {
        self.closure = closure
    }
    
    override func resume() {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()) {
            self.closure()
        }
    }
}
