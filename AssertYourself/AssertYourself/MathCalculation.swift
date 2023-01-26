//
//  MathCalculation.swift
//  AssertYourself
//
//  Created by Ayush Bhatt on 26/01/23.
//

import Foundation

class MathCalculation{
    func getGCD(x: Int, y: Int) -> Int{
        if y == 0{
            return x
        }
        return getGCD(x: y, y: x%y)
    }
    
    func factorial(n: Int) -> Int{
        if n == 0{
            return 1
        }
        return n * factorial(n: n-1)
    }
    
    func fibonacci(n: Int) -> Int{
        if n < 2{
            return n
        }
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
}
