//
//  ViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/11/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit
import Alamofire
import SCLAlertView

class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var searchButton: MaterialButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleImage = UIImage(named: "early-bird-title")
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFit
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        titleImageView.frame = titleView.bounds
        titleView.addSubview(titleImageView)
        
        self.navigationItem.titleView = titleView

        loadingIndicator.isHidden = true
        
        searchTextField.delegate = self
        locationTextField.delegate = self
        
        SCLAlertView().showInfo("Welcome to Early Bird", subTitle: "Enter a search to see a list of potential clients")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        results.removeAll()
        resetView()
    }
    
    func resetView() {
        searchButton.isHidden = false
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimating()
    }

    func getResults(business: String, location: String) {
        var nameForInit,urlForInit: String!
        
        let path = "\(BASE_URL)\(business)&location=\(location)"
    
        Alamofire.request(path).responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                if let data = json["data"] as? [Dictionary<String, Any>] {
                    
                    for i in 0..<data.count {
                        if let name = data[i]["name"] as? String {
                            nameForInit = name
                        }
                        
                        if let url = data[i]["url"] as? String {
                            urlForInit = url
                        }
                        
                        let result = Result.init(name: nameForInit, url: urlForInit)
                        self.results.append(result)
                    }
                    
                    if self.results.isEmpty {
                        self.resetView()
                        SCLAlertView().showError("No results found", subTitle: "Enter another search and try again.")
                    } else {
                        self.performSegue(withIdentifier: SEGUE_SHOW_RESULTS, sender: self.results)
                    }
                }
            }
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text != "" && locationTextField.text != "" {
            let search = searchTextField.text!
            let location = locationTextField.text!
            
            if validateZipCode(zipCode: location) {
                let trimmedSearch = search.replacingOccurrences(of: " ", with: "")
                
                getResults(business: trimmedSearch, location: location)
                
                searchButton.isHidden = true
                loadingIndicator.isHidden = false
                loadingIndicator.startAnimating()
            } else {
                SCLAlertView().showError("Invalid zip code", subTitle: "Enter a valid 5-digit zip code and try again")
            }
        } else {
            SCLAlertView().showError("No blank inputs", subTitle: "Enter non-blank inputs and try again")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_SHOW_RESULTS {
            if let resultsVC = segue.destination as? ResultsViewController {
                if let results = sender as? [Result] {
                    resultsVC.results = results
                }
            }
        }
    }
    
    func validateZipCode(zipCode: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "\\b\\d{5}\\b", options: [])
            let testString = zipCode as NSString
            let results = regex.numberOfMatches(in: zipCode, options: [], range: NSMakeRange(0, testString.length))
            
            if results == 0 {
                return false
            } else {
                return true
            }
        } catch let error as NSError {
            print("Invalid regex: \(error.localizedDescription)")
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
