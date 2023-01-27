//
//  CoveredClass.swift
//  CodeCoverage
//
//  Created by Ayush Bhatt on 26/01/23.
//

import UIKit

class CoveredClass{
    
    private(set) var area: Int
    
    var width: Int{
        didSet{
            area = width * width
            let color: UIColor = redOrGreen(for: width)
            drawSquare(width: width, color: color)
        }
    }
    
    init(){
        area = 0
        width = 0
    }
    
    private func redOrGreen(for width: Int) -> UIColor{
        return width % 2 == 0 ? .green : .red
    }
    
    private func drawSquare(width: Int, color: UIColor){
        
    }
    
    static func max(_ x: Int, _ y: Int) -> Int{
        if x > y{
            return x
        }
        return y
    }
    
    static func commaSeparated(from x: Int, to y: Int) -> String{
        var result = ""
        if x > y{
            return result
        }
        for num in x..<y{
            result += "\(num),"
        }
        result += "\(y)"
        
        return result
    }
}
