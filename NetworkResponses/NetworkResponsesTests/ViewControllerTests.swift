//
//  ViewControllerTests.swift
//  NetworkResponsesTests
//
//  Created by Ayush Bhatt on 21/02/23.
//

import XCTest
@testable import NetworkResponses
import ViewControllerPresentationSpy

final class ViewControllerTests: XCTestCase {
    
    var session: SpyURLSession!
    var sut: ViewController!
    var alertVerifier: AlertVerifier!
    
    @MainActor override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        session = SpyURLSession()
        sut.session = session
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        session = nil
        alertVerifier = nil
        
        super.tearDown()
    }
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveInResults(){
        tap(sut.searchButton)
                
        let handleResultsCalled = expectation(description: "handleResults called!")
        sut.handleResults = {_ in
            handleResultsCalled.fulfill()
        }
        
        session.dataTaskArgsCompletionHandler.first?(getSampleJSON(), getSampleResponse(statusCode: 200), nil)
        
        waitForExpectations(timeout: 0.01)
        
        XCTAssertEqual(sut.searchResults, [SearchResults(artistName: "Artist", trackName: "Track", averageUserRating: 2.5, genres: ["Foo", "Bar"])])
    }
    
    func test_searchForBookNetworkCall_withSuccessResponseBeforeAsync_shouldNotSaveDataInResults(){
        tap(sut.searchButton)
        
        session.dataTaskArgsCompletionHandler.first?(getSampleJSON(), getSampleResponse(statusCode: 200), nil)
        
        XCTAssertEqual(sut.searchResults, [])
    }
    
    @MainActor func test_searchForBookNetwordkCall_withError_shouldShowAlert(){
        tap(sut.searchButton)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }
        
        session.dataTaskArgsCompletionHandler.first?(nil, nil, TestError(message: "oh no"))
        
        waitForExpectations(timeout: 0.01)
        verifyErrorAlert(message: "oh no")
    }
    
    @MainActor func test_searchForBookNetworkCall_withErrorBeforeAsync_shouldNotShowAlert(){
        tap(sut.searchButton)
        
        session.dataTaskArgsCompletionHandler.first?(nil, nil, TestError(message: "oh no"))
        
        XCTAssertEqual(alertVerifier.presentedCount, 0)
    }
    
    //MARK:  Test Helper functions
    
    func tap(_ button: UIButton){
        button.sendActions(for: .touchUpInside)
    }
    
    private func getSampleJSON() -> Data{
        """
            {
                "results": [
                    {
                        "artistName": "Artist",
                        "trackName": "Track",
                        "averageUserRating": 2.5,
                        "genres": [
                            "Foo",
                            "Bar"
                        ]
                    }
                ]
            }
        """.data(using: .utf8)!
    }
    
    private func getSampleResponse(statusCode: Int) -> HTTPURLResponse?{
        HTTPURLResponse(url: URL(string: "http://DUMMY")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
    
    @MainActor private func verifyErrorAlert(message: String, file: StaticString = #file, line: UInt = #line){
        alertVerifier.verify(
            title: "Network Problem",
            message: message,
            animated: true,
            actions: [
                .default("OK")
            ],
            presentingViewController: sut,
            file: file,
            line: line
        )
        
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK")
    }
}
