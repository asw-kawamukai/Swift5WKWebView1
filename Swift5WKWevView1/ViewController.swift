//
//  ViewController.swift
//  Swift5WKWevView1
//
//  Created by ASW Kawamukai on 2020/06/08.
//  Copyright © 2020 ASW Kawamukai. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    var webView = WKWebView()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
   @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - toolBar.frame.height*2)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.yahoo.co.jp")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        indicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("読み込み完了")
        
        indicator.stopAnimating()
    }

    @IBAction func goPage(_ sender: Any) {
        webView.goForward()
        
    }
    
    @IBAction func backPage(_ sender: Any) {
        webView.goBack()
    
    }
}

