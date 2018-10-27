//
//  ViewController.swift
//  Texans
//
//  Created by WaterFlower124 on 7/24/18.
//  Copyright © 2018 WaterFlower125. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        let url:URL = URL(string: "http://www.texansterritory.com")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()

        }
    }
    
    @IBAction func forwardButtonClicked(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func refreshButtonClicked(_ sender: Any) {
        webView.reload()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
    

}

