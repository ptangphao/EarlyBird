//
//  WebsiteViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/12/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController {

    var websiteUrl: String!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Yelp Page"
        
        webView = WKWebView(frame: view.frame)
        view.addSubview(webView)
        
        if let url = URL(string: websiteUrl) {
            
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
