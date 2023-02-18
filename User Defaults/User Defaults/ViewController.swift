//
//  ViewController.swift
//  User Defaults
//
//  Created by Ayush Bhatt on 17/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    
    private var count = 0{
        didSet{
            countLabel.text = "\(count)"
            userDefaults.set(count, forKey: "count")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = userDefaults.integer(forKey: "count")
    }

    @IBAction func didTapIncrementButton(){
        count += 1
    }

}

extension UserDefaults: UserDefaultsProtocol{}

protocol UserDefaultsProtocol{
    func set(_ value: Int, forKey defaultName: String)
    
    func integer(forKey defaultName: String) -> Int
}
