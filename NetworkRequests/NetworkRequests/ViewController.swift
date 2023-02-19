//
//  ViewController.swift
//  NetworkRequests
//
//  Created by Ayush Bhatt on 18/02/23.
//

import UIKit

protocol URLSessionProtocol{
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol{}

class ViewController: UIViewController {
    
    @IBOutlet weak private(set) var searchButton: UIButton!
    var session: URLSessionProtocol = URLSession.shared
    private var dataTask: URLSessionDataTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func didTapButton(){
        searchForBook(terms: "out from boneville")
    }
    
    private func searchForBook(terms: String){
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(encodedTerms)") else{return}
        
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            guard let self = self else{return}
            
            let decoded = String(data: data ?? Data(), encoding: .utf8)
            
            print("response: \(String(describing: response))")
            print("data: \(String(describing: decoded))")
            print("error: \(String(describing: error))")
            
            DispatchQueue.main.async{
                self.dataTask = nil
                self.searchButton.isEnabled = true
            }
        })
        self.searchButton.isEnabled = false
        dataTask?.resume()
        
    }

}

