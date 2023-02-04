//
//  XIBBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Ayush Bhatt on 31/01/23.
//

import XCTest
@testable import LoadViewControllers

final class XIBBasedViewControllerTests: XCTestCase {

    func test_loading(){
        let sut = XIBBasedViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label)
    }

}
