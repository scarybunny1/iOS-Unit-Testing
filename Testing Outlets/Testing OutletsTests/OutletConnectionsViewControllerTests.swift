//
//  OutletConnectionsViewControllerTests.swift
//  Testing OutletsTests
//
//  Created by Ayush Bhatt on 11/02/23.
//

import XCTest
@testable import Testing_Outlets

final class OutletConnectionsViewControllerTests: XCTestCase {

    func test_outlets_shouldBeConnected(){
        let sut = OutletConnectionsViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label, "Label outlet not connected")
        XCTAssertNotNil(sut.textField, "Text field outlet not connected")
        XCTAssertNotNil(sut.imageView, "Image view outlet not connected")
        XCTAssertNotNil(sut.button, "Button outlet not connected")
    }

}
