//
//  InstancePropertyViewControllerTests.swift
//  Hard DependenciesTests
//
//  Created by Ayush Bhatt on 04/02/23.
//

import XCTest
@testable import Hard_Dependencies

final class InstancePropertyViewControllerTests: XCTestCase {

    func test_viewDidAppear(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut = sb.instantiateViewController(withIdentifier: "InstancePropertyViewController") as! InstancePropertyViewController
        
        sut.analytics = Analytics()
        
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
