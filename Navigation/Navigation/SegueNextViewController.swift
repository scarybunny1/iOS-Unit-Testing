//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by Ayush Bhatt on 13/02/23.
//

import UIKit

class SegueNextViewController: UIViewController {
    
    @IBOutlet private(set) var label: UILabel!
    
    var labelText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }

}
