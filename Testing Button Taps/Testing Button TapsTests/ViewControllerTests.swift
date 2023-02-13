//
//  ViewControllerTests.swift
//  Testing Button TapsTests
//
//  Created by Ayush Bhatt on 11/02/23.
//

import XCTest
@testable import Testing_Button_Taps

final class ViewControllerTests: XCTestCase {

    func test_outlets_shouldBeConnected(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.button, "Button outlet not connected")
    }
    
    func test_tappingButton(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
        
        tap(sut.button)
    }
    
}
