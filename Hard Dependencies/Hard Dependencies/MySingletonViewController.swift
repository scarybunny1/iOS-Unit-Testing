//
//  MySingletonViewController.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 04/02/23.
//

import UIKit

class MySingletonViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MySingletonAnalytics.shared.track(event: ">> viewDidAppear: \(type(of: self))")
    }

}
