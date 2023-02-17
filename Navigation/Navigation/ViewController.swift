//
//  ViewController.swift
//  Navigation
//
//  Created by Ayush Bhatt on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private(set) var codePushButton: UIButton!
    @IBOutlet weak private(set) var codeModalButton: UIButton!
    @IBOutlet weak private(set) var seguePushButton: UIButton!
    @IBOutlet weak private(set) var segueModalButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit{
        print(">> ViewController deinit called")
    }
    
    @IBAction private func didTapCodePushButton(){
        let nextVC = CodeNextViewController(labelText: "Pushed using code push button")
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction private func didTapCodeModalButton(){
        let nextVC = CodeNextViewController(labelText: "Presented using code modal button")
        present(nextVC, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "pushNext":
            guard let vc = segue.destination as? SegueNextViewController else{return}
            vc.labelText = "Pushed using segue push button"
        case "modalNext":
            guard let vc = segue.destination as? SegueNextViewController else{return}
            vc.labelText = "Presented using segue modal button"
        default:
            break
        }
    }
}

