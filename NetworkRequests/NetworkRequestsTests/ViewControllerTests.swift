//
//  ViewControllerTests.swift
//  NetworkRequestsTests
//
//  Created by Ayush Bhatt on 18/02/23.
//

import XCTest
@testable import NetworkRequests

final class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_outlets_shouldBeConnected(){
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.searchButton)
    }
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville(){
        mockSession = MockURLSession()
        sut.session = mockSession
        sut.loadViewIfNeeded()

        tap(sut.searchButton)

        mockSession.verifyDataTask(with: URLRequest(url: URL(string: "https://itunes.apple.com/search?media=ebook&term=out%20from%20boneville")!))
    }
    
    //MARK:  Test Helper Functions
    func tap(_ button: UIButton){
        button.sendActions(for: .touchUpInside)
    }
}
