//
//  InstancePropertyViewController.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 04/02/23.
//

import UIKit

class InstancePropertyViewController: UIViewController {
    
    lazy var analytics: Analytics = Analytics.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.track(event: ">> viewDidAppear: \(type(of: self))")
    }

}
