//
//  Analytics.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 03/02/23.
//

import Foundation

class Analytics{
    static let shared = Analytics()
    
    func track(event: String){
        print(">> \(event)")
        
        if self !== Analytics.shared{
            print(">> Not Analytics singleton")
        }
    }
}
