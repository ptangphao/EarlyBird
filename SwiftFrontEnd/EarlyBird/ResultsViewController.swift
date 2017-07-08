//
//  ResultsViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/12/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resultsTableView: UITableView!
    
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Results"
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = resultsTableView.dequeueReusableCell(withIdentifier: CELL_ID_RESULT, for: indexPath) as? ResultCell {
            
            let result = results[indexPath.row]
            cell.configureCell(result: result)
            
            return cell
            
        } else {
            return ResultCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let websiteUrl = results[indexPath.row].resultUrl
        
        performSegue(withIdentifier: SEGUE_SHOW_WEBSITE, sender: websiteUrl)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_SHOW_WEBSITE {
            if let websiteVC = segue.destination as? WebsiteViewController {
                if let websiteUrl = sender as? String {
                    websiteVC.websiteUrl = websiteUrl
                }
            }
        }
    }
}
