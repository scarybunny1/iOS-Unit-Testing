//
//  MyClassTests.swift
//  LifecycleTests
//
//  Created by Ayush Bhatt on 26/01/23.
//

import XCTest
@testable import Lifecycle

//How does the XCTest framework work?
//It finds out all the classes subclassing XCTest, and for each, finds the count of test methods written inside them.
//It creates 'count' number of instances of XCTestClass and adds them to the test suite
//After all the test cases are set up, it runs them one by one
//It destroys the instance once the test has ended


final class MyClassTests: XCTestCase {
    //Stored properties should be implicitly unwrapped optionals
    private var sut: MyClass!
    
    override func setUp() {
        //Arrange
        super.setUp()
        sut = MyClass()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_methodOne(){
        //Act
        sut.methodOne()
        
        //Assert
    }
    
    func test_methodTwo(){
        //Act
        sut.methodTwo()
        
        //Assert
    }
}
