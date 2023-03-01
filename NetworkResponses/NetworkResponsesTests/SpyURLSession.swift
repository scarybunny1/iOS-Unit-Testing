//
//  SpyURLSession.swift
//  NetworkResponsesTests
//
//  Created by Ayush Bhatt on 21/02/23.
//

import Foundation
@testable import NetworkResponses

private class DummyURLSessionDataTask: URLSessionDataTask{
    override func resume(){
        
    }
}

class SpyURLSession: URLSessionProtocol{
    var dataTaskCallCount: Int = 0
    var dataTaskArgsRequest: [URLRequest] = []
    var dataTaskArgsCompletionHandler: [(Data?, HTTPURLResponse?, Error?) -> Void] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        
        return DummyURLSessionDataTask()
    }
    
    
}
