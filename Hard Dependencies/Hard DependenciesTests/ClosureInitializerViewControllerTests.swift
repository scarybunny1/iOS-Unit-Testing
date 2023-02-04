//
//  ClosureInitializerViewControllerTests.swift
//  Hard DependenciesTests
//
//  Created by Ayush Bhatt on 04/02/23.
//

import XCTest
@testable import Hard_Dependencies

final class ClosureInitializerViewControllerTests: XCTestCase {
    func test_viewDidAppear(){
        let sut = ClosureInitializerViewController {
            Analytics()
        }
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
