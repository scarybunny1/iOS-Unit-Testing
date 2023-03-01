//
//  ViewController.swift
//  NetworkResponses
//
//  Created by Ayush Bhatt on 19/02/23.
//

import UIKit

struct Search: Decodable{
    var results: [SearchResults]
}

struct SearchResults: Decodable, Equatable{
    var artistName: String
    var trackName: String
    var averageUserRating: Float
    var genres: [String]
}

class ViewController: UIViewController {
    
    @IBOutlet weak private(set) var searchButton: UIButton!
    
    var handleResults: (([SearchResults]) -> Void) = { print(String(describing: $0)) }
    private var dataTask: URLSessionDataTask?
    var session: URLSessionProtocol = URLSession.shared
    var searchResults: [SearchResults] = [] {
        didSet{
            handleResults(searchResults)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func didTapSearchButton(){
        searchForBook(terms: "Out from boneville")
    }
    
    private func searchForBook(terms: String){
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(encodedTerms)") else{return}
        
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            
            guard let self = self else{return}
            
            DispatchQueue.main.async {
                
                var decoded: Search?
                var errorMessage: String?
                
                if let error = error{
                    errorMessage = error.localizedDescription
                }
                else if let response = response as? HTTPURLResponse, response.statusCode != 200{
                    errorMessage = "Response: " + HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
                }
                else if let data = data{
                    do{
                        decoded = try JSONDecoder().decode(Search.self, from: data)
                    }
                    catch{
                        errorMessage = error.localizedDescription
                    }
                }
                
                
                if let decoded = decoded{
                    self.searchResults = decoded.results
                }
                if let errorMessage = errorMessage{
                    self.showError(errorMessage)
                }
                self.dataTask = nil
                self.searchButton.isEnabled = true
            }
            
        })
        dataTask?.resume()
        searchButton.isEnabled = false
    }
    
    private func showError(_ errorMessage: String){
        let alertVC = UIAlertController(title: "Network Problem", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okAction)
        alertVC.preferredAction = okAction
        present(alertVC, animated: true)
    }
}

protocol URLSessionProtocol{
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol{}
