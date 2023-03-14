//
//  ChangePasswordViewController.swift
//  Refactoring
//
//  Created by Ayush Bhatt on 11/03/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet private(set) weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet private(set) weak var oldPasswordField: UITextField!
    @IBOutlet private(set) weak var newPasswordField: UITextField!
    @IBOutlet private(set) weak var confirmPasswordField: UITextField!
    @IBOutlet private(set) weak var submitButton: UIButton!
    
    private var passwordChanger = PasswordChanger()
    var securityToken = ""
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red: 55/255.0, green: 147/255.0, blue: 251/255.0, alpha: 1).cgColor
        submitButton.layer.cornerRadius = 8
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
    }
    
    @IBAction func didTapCancelBarButton(){
        oldPasswordField.resignFirstResponder()
        newPasswordField.resignFirstResponder()
        confirmPasswordField.resignFirstResponder()
        dismiss(animated: true)
    }
    
    @IBAction func didTapSubmitButton(){
        //Validate Input
        if oldPasswordField.text?.isEmpty ?? true{
            oldPasswordField.becomeFirstResponder()
            return
        }
        if newPasswordField.text?.isEmpty ?? true{
            let alertVC = UIAlertController(title: nil, message: "Please enter a new password", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default){[weak self] _ in
                self?.newPasswordField.becomeFirstResponder()
            })
            present(alertVC, animated: true)
            return
        }
        if newPasswordField.text?.count ?? 0 < 6{
            let alertVC = UIAlertController(title: nil, message: "The new password should contain atleast 6 characters", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default){[weak self] _ in
                self?.newPasswordField.text = ""
                self?.confirmPasswordField.text = ""
                self?.newPasswordField.becomeFirstResponder()
            })
            present(alertVC, animated: true)
            return
        }
        if newPasswordField.text != confirmPasswordField.text{
            let alertVC = UIAlertController(title: nil, message: "The new password and confirm password do not match. Please try again.", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default){[weak self] _ in
                self?.newPasswordField.text = ""
                self?.confirmPasswordField.text = ""
                self?.newPasswordField.becomeFirstResponder()
            })
            present(alertVC, animated: true)
            return
        }
        
        //Set up waiting appearance
        oldPasswordField.resignFirstResponder()
        newPasswordField.resignFirstResponder()
        confirmPasswordField.resignFirstResponder()
        cancelBarButton.isEnabled = false
        view.backgroundColor = .clear
        view.addSubview(blurView)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        
        //Attempt to change password
        passwordChanger.change(securityToken: securityToken, oldPassword: oldPasswordField.text ?? "", newPassword: newPasswordField.text ?? "") { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.removeFromSuperview()
            let alertVC = UIAlertController(title: nil, message: "Your password has been successfully changed.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default){[weak self] _ in
                self?.dismiss(animated: true)
            }
            alertVC.addAction(okAction)
            alertVC.preferredAction = okAction
            
            self?.present(alertVC, animated: true)
        } onFailure: { [weak self] errorMessage in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.removeFromSuperview()
            let alertVC = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default){[weak self] _ in
                self?.oldPasswordField.text = ""
                self?.newPasswordField.text = ""
                self?.confirmPasswordField.text = ""
                self?.oldPasswordField.becomeFirstResponder()
                self?.view.backgroundColor = .white
                self?.blurView.removeFromSuperview()
                self?.cancelBarButton.isEnabled = true
            }
            alertVC.addAction(okAction)
            alertVC.preferredAction = okAction
            self?.present(alertVC, animated: true)
        }

    }
}
