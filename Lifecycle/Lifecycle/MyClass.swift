//
//  MyClass.swift
//  Lifecycle
//
//  Created by Ayush Bhatt on 26/01/23.
//

import Foundation

class MyClass{
    private static var allInstances = 0
    private let instance: Int
    
    init(){
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit{
        print(">> MyClass.deinit #\(instance)")
    }
    
    func methodOne(){
        print(">> \(#function)")
    }
    
    func methodTwo(){
        print(">> \(#function)")
    }
}
