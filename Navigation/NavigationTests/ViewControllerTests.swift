//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by Ayush Bhatt on 14/02/23.
//

import UIKit
import XCTest
@testable import Navigation

final class ViewControllerTests: XCTestCase {

    func test_tappingCodePushButton_navigatesToCodeNextViewController(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
        
        let nc = UINavigationController(rootViewController: sut)
        sut.codePushButton.sendActions(for: .touchUpInside)
        executeRunLoop()
        
        XCTAssertEqual(nc.viewControllers.count, 2)
        
        let pushedVC = nc.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else{
            XCTFail("Expected CodeNextViewController, but got \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed using code push button")
    }
    
    //MARK:  Test Helper
    func executeRunLoop(){
        RunLoop.current.run(until: Date())
    }
}
