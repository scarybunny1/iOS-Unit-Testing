//
//  StoryboardBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Ayush Bhatt on 29/01/23.
//

import XCTest
@testable import LoadViewControllers

final class StoryboardBasedViewControllerTests: XCTestCase {

    func test_loading(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: StoryboardBasedViewController = sb.instantiateViewController(identifier: StoryboardBasedViewController.identifier)
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label)
        
        
    }

}
