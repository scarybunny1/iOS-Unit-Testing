//
//  CodeNextViewController.swift
//  Navigation
//
//  Created by Ayush Bhatt on 13/02/23.
//

import UIKit

class CodeNextViewController: UIViewController {
    
    var label = UILabel()

    init(labelText: String){
        label.text = labelText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
    }
    
    deinit{
        print(">> CodeNextViewController deinit called")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
