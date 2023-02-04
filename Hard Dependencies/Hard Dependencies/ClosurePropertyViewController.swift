//
//  ClosurePropertyViewController.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 04/02/23.
//

import UIKit

class ClosurePropertyViewController: UIViewController {
    
    lazy var makeAnalytics: () -> Analytics = {Analytics.shared}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeAnalytics().track(event: ">> viewDidAppear: \(type(of: self))")
    }

}
