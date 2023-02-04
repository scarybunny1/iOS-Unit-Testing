//
//  ClosurePropertyViewControllerTests.swift
//  Hard DependenciesTests
//
//  Created by Ayush Bhatt on 04/02/23.
//

import XCTest
@testable import Hard_Dependencies

final class ClosurePropertyViewControllerTests: XCTestCase {
    func test_viewDidAppear(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ClosurePropertyViewController = sb.instantiateViewController(identifier: String(describing: ClosurePropertyViewController.self))
        sut.makeAnalytics = {Analytics()}
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }
}
