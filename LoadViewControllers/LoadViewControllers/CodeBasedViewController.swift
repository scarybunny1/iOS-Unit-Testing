//
//  CodeBasedViewController.swift
//  LoadViewControllers
//
//  Created by Ayush Bhatt on 31/01/23.
//

import UIKit

class CodeBasedViewController: UIViewController {
    
    var data: String
    
    init(string: String){
        self.data = string
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(">>load views here")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
