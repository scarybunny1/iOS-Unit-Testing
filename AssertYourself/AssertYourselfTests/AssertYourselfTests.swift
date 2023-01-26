//
//  AssertYourselfTests.swift
//  AssertYourselfTests
//
//  Created by Ayush Bhatt on 25/01/23.
//

import XCTest
@testable import AssertYourself

struct SimpleStruct: CustomStringConvertible{
    var description: String{
        return "\(key):\(value)"
    }
    
    let key: Int
    let value: Int
    
    func addTwoValues(x: Int, y: Int) -> Int?{
        return x + y
    }
    
    func add() -> Int{
        return key + value
    }
}

final class AssertYourselfTests: XCTestCase {
    
    func test_fail(){
        XCTFail()
    }
    
    func test_fail_withSimpleMessage(){
        XCTFail("This is a failing test!")
    }
    
    func test_fail_withInterpolatedString(){
        let theAnswer = 42
        XCTFail("The answer to the Great Question is \(theAnswer)")
    }
    
    func test_avoidConditionalCode(){
        let failure = true
        if failure{
            XCTFail("It is not a success.")
        }
    }
    
    func test_assertTrue(){
        let success = true
        XCTAssertTrue(success)
    }
    
    func test_assertNil(){
        let optionalValue: Int? = 12
        XCTAssertNil(optionalValue)
    }
    
    func test_assertNilStruct(){
        let object: SimpleStruct? = SimpleStruct(key: 1, value: 2)
        XCTAssertNil(object)
    }
    
    func test_assertEqual(){
        let ss = SimpleStruct(key: 1, value: 2)
        XCTAssertEqual(ss.add(), ss.addTwoValues(x: 1, y: 2))
    }
    
    func test_floatingPointDanger(){
        let value = 0.1 + 0.2
        XCTAssertEqual(value, 0.3, accuracy: 0.000000001)
    }
    
    //MARK:  MathCalculation Tests
    
    func test_getGCD_returnsCorrectAnswer(){
        let sut = MathCalculation()
        let x = 12
        let y = 108
        
        XCTAssertEqual(sut.getGCD(x: x, y: y), 12)
    }
    
    func test_factorial_returnsCorrectAnswer(){
        let sut = MathCalculation()
        let n = 2
        
        XCTAssertEqual(sut.factorial(n: n), 2)
    }
    
    func test_fibonacci_returnsCorrectAnswer(){
        let sut = MathCalculation()
        let n = 8
        
        XCTAssertEqual(sut.fibonacci(n: n), 21)
    }
}
