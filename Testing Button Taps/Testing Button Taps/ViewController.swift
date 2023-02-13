//
//  ViewController.swift
//  Testing Button Taps
//
//  Created by Ayush Bhatt on 11/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func didTapButton(){
        print(">> Button was tapped")
    }
    
}

