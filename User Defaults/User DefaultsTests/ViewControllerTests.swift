//
//  ViewControllerTests.swift
//  User DefaultsTests
//
//  Created by Ayush Bhatt on 17/02/23.
//

import XCTest
import UIKit
@testable import User_Defaults

final class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!
    var defaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        defaults = FakeUserDefaults()
        sut.userDefaults = defaults
    }
    
    override func tearDown() {
        sut = nil
        defaults = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0AsCountValue(){
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.countLabel.text, "0")
    }
    
    func test_viewDidLoad_with7InUserDefaults_shouldShow7AsCountValue(){
        defaults.integers = ["count": 7]
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.countLabel.text, "7")
    }
    
    func test_tappingButton_with12InUserDefaults_shouldWrite13ToUserDefaults(){
        defaults.integers = ["count": 12]
        
        sut.loadViewIfNeeded()
        tap(sut.incrementButton)
        
        XCTAssertEqual(defaults.integers["count"], 13)
    }
    
    func test_tappingButton_with42InUserDefaults_shouldShow43InCounterLabel(){
        defaults.integers["count"] = 42
        
        sut.loadViewIfNeeded()
        tap(sut.incrementButton)
        
        XCTAssertEqual(sut.countLabel.text, "43")
    }

    
    //MARK:  Test Helper functions
    private func tap(_ button: UIButton){
        button.sendActions(for: .touchUpInside)
    }
}

class FakeUserDefaults: UserDefaultsProtocol{
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        return integers[defaultName] ?? 0
    }
}
