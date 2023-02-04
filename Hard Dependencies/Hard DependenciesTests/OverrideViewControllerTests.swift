//
//  OverrideViewControllerTests.swift
//  Hard DependenciesTests
//
//  Created by Ayush Bhatt on 04/02/23.
//

import XCTest
@testable import Hard_Dependencies

final class OverrideViewControllerTests: XCTestCase {

    func test_viewDidAppear(){
        let sut = TestableOverrideViewCOntroller()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }

}

private class TestableOverrideViewCOntroller: OverrideViewController{
    override func analytics() -> Analytics {
        Analytics()
    }
}
