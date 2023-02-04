//
//  MySingletonAnalytics.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 03/02/23.
//

import Foundation

class MySingletonAnalytics{
    static var shared: MySingletonAnalytics{
    #if DEBUG
        if let stubbedInstance = stubbedInstance{
            return stubbedInstance
        }
    #endif
        
        return instance
    }
    private static let instance = MySingletonAnalytics()
    
    #if DEBUG
        static var stubbedInstance: MySingletonAnalytics?
    #endif
    
    
    func track(event: String){
        Analytics.shared.track(event: event)
        
        if self !== MySingletonAnalytics.instance{
            print(">> Not MySingletonAnalytics singleton")
        }
    }
}
