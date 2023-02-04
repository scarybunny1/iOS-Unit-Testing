//
//  MySingletonViewControllerTests.swift
//  Hard DependenciesTests
//
//  Created by Ayush Bhatt on 04/02/23.
//

import XCTest
@testable import Hard_Dependencies

final class MySingletonViewControllerTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        MySingletonAnalytics.stubbedInstance = MySingletonAnalytics()
    }

    override class func tearDown() {
        MySingletonAnalytics.stubbedInstance = nil
        super.tearDown()
    }
    
    func test_viewDidAppear(){
        let sut = MySingletonViewController()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(true)
    }
}
