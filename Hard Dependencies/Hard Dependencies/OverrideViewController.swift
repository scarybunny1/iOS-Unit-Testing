//
//  OverrideViewController.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 04/02/23.
//

import UIKit

class OverrideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func analytics() -> Analytics {
        return Analytics.shared
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics().track(event: ">> viewDidAppear: \(type(of: self))")
    }

}
