//
//  EditorViewController.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/17/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import UIKit
import WebKit
import Moya

class EditorViewController: UIViewController, WKNavigationDelegate {
    
    var editorWebView: WKWebView!
    
    func handleInComingText(text: String, textCompletionHandler: @escaping (String?, Error?)-> Void){
        print(text)
        textCompletionHandler(text, nil)
    }
    
    
    override func loadView() {
        editorWebView = WKWebView()
        editorWebView.navigationDelegate = self
        view = editorWebView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://beta.kjuicer.com/papers/i/486069b9-b244-4a2d-9a86-e81b986e5071/edit/27a8076d-518f-46e9-978c-660513a9ba34/")!
        editorWebView.load(URLRequest(url: url))
        editorWebView.allowsBackForwardNavigationGestures = false
    }
    
}
