//
//  RecipeDetailsWebViewController.swift
//  RecipeFinder
//
//  Created by Rekha Manju Kiran on 08/10/2017.
//  Copyright © 2017 xDesign. All rights reserved.
//

import UIKit
import WebKit

class RecipeDetailsWebViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var recipeDetailsWebView: WKWebView!
    var recipeDetailsUrl: String!
    var recipeTitle: String!
    
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        title = recipeTitle
        if let url = URL(string: recipeDetailsUrl) {
        recipeDetailsWebView.load(URLRequest(url: url))
        }
        recipeDetailsWebView.navigationDelegate = self
        
        activityIndicator.hidesWhenStopped = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
