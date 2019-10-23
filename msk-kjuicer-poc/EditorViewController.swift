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
    
    func handleInComingText(text: String, textCompletionHandler: @escaping (Paper?, Error?)-> Void){
        let kJuicerAPIProvider = NetworkManager.provider
        kJuicerAPIProvider.request(.postTextToEditor(key: APIKeys.mainKey.rawValue, title:"From Moleskine Notes", content: text)) {  result in
            switch result {
            case let .success(moyaResponse):
                do{
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    
                    let paperResult = try filteredResponse.map(Paper.self)
                    if let paper = paperResult as Paper? {
                        if let url = URL(string: paper.url){
                            self.editorWebView.load(URLRequest(url: url))
                            self.editorWebView.allowsBackForwardNavigationGestures = false
                            textCompletionHandler(paper, nil)
                        }
                    }
                } catch let error {
                    textCompletionHandler(nil, error)
                }
            case let .failure(error):
                textCompletionHandler(nil, error)
            }
        }
        
    }
    
    
    override func loadView() {
        editorWebView = WKWebView()
        editorWebView.navigationDelegate = self
        view = editorWebView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
