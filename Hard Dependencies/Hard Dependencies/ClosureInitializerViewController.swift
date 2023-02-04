//
//  ClosureInitializerViewController.swift
//  Hard Dependencies
//
//  Created by Ayush Bhatt on 04/02/23.
//

import UIKit

class ClosureInitializerViewController: UIViewController {
    
    private let makeAnalytics: () -> Analytics
    
    init(makeAnalytics: @escaping () -> Analytics = {Analytics.shared}){
        self.makeAnalytics = makeAnalytics
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let analytics = makeAnalytics()
        analytics.track(event: ">> viewDidAppear: \(type(of: self))")
    }
}
