//
//  CodeBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Ayush Bhatt on 31/01/23.
//

import XCTest
@testable import LoadViewControllers

final class CodeBasedViewControllerTests: XCTestCase {

    func test_loading(){
        let sut = CodeBasedViewController(string: "DUMMY")
        
        sut.loadViewIfNeeded()
    }

}
