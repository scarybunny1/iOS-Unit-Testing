//
//  ViewController.swift
//  Alerts
//
//  Created by Ayush Bhatt on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func didTapButton(){
        print(">> Button tapped")
        let alertVC = UIAlertController(title: "Alert", message: "This is an alert", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default){_ in
            print(">> Okay")
        }
        alertVC.addAction(okAction)
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel){_ in
            print(">> Cancel")
        })
        alertVC.preferredAction = okAction
        present(alertVC, animated: true)
    }

}

