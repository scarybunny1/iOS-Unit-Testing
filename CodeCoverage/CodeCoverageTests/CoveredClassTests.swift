//
//  CoveredClassTests.swift
//  CodeCoverageTests
//
//  Created by Ayush Bhatt on 26/01/23.
//

import XCTest

@testable import CodeCoverage

final class CoveredClassTests: XCTestCase {

    func test_max_with10And12_shouldReturn10(){
        let result = CoveredClass.max(10, 12)
        
        XCTAssertEqual(result, 12)
    }

    func test_max_with9And3_shouldReturn9(){
        let result = CoveredClass.max(9, 3)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_max_with1And1_shouldReturn1(){
        let result = CoveredClass.max(1, 1)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_commaSeparated_withRangeFrom0To9_shouldReturn0123456789SeparatedByCommas(){
        let result = CoveredClass.commaSeparated(from: 0, to: 9)
        
        XCTAssertEqual(result, "0,1,2,3,4,5,6,7,8,9")
    }
    
    func test_commaSeparated_withRangeFrom1To1_shouldReturn1(){
        let result = CoveredClass.commaSeparated(from: 1, to: 1)
        
        XCTAssertEqual(result, "1")
    }
    
    func test_commaSeparated_withRangeFrom9To0_shouldReturnEmptyString(){
        let result = CoveredClass.commaSeparated(from: 9, to: 0)
        
        XCTAssertEqual(result, "")
    }
    
    func test_area_withWidth7_shouldReturn49(){
        let sut = CoveredClass()
        sut.width = 7
        
        XCTAssertEqual(sut.area, 49)
    }
}
