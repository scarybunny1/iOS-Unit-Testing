//
//  ViewController.swift
//  TextField
//
//  Created by Ayush Bhatt on 06/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private(set) var usernameField: UITextField!
    @IBOutlet weak private(set) var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
    }

    deinit{
        print("Viewcontroller deinit")
    }
    
    private func performLogin(username: String, password: String){
        print("Username: " + username + "\nPassword: " + password)
    }
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === usernameField{
            return !string.contains(" ")
        }
        else{
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameField{
            passwordField.becomeFirstResponder()
        }
        else{
            guard let username = usernameField.text, let password = passwordField.text else{return false}
            passwordField.resignFirstResponder()
            performLogin(username: username, password: password)
        }
        return true
    }
}
