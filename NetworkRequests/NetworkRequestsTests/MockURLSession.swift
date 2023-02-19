//
//  MockURLSession.swift
//  NetworkRequestsTests
//
//  Created by Ayush Bhatt on 18/02/23.
//

import XCTest
@testable import NetworkRequests

class MockURLSession: URLSessionProtocol{
    
    var dataTaskCallCount: Int = 0
    var dataTaskArgsRequest: [URLRequest] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        return DummyURLSessionDataTask()
    }
    
    func verifyDataTask(with request: URLRequest, file: StaticString = #file, line: UInt = #line){
        
        guard dataTaskWasCalledOnce(file: file, line: line) else{return}
        XCTAssertEqual(dataTaskArgsRequest.first, request, "request", file: file, line: line)
    }
    
    private func dataTaskWasCalledOnce(file: StaticString = #file, line: UInt = #line) -> Bool{
        return verifyDataTaskIsCalledOnce(methodName: "dataTask(with: completionHandler:)", callCount: dataTaskCallCount, describeArguments: "request: \(dataTaskArgsRequest)", file: file, line: line)
    }
}

func verifyDataTaskIsCalledOnce(methodName: String, callCount: Int, describeArguments: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> Bool{
    if callCount == 0{
        XCTFail("Wanted but not invoked: \(methodName)", file: file, line: line)
        return false
    }
    else if callCount > 1{
        XCTFail("Wanted 1 times, but called \(callCount) times." + "\(methodName) with \(describeArguments())", file: file, line: line)
        return false
    }
    return true
}

class DummyURLSessionDataTask: URLSessionDataTask{
    override func resume(){
        
    }
}
