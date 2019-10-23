//
//  ShareViewController.swift
//  msk-kjuicer-poc-share
//
//  Created by Gabriel Walsh on 10/17/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var textPreview: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func cancelShare(_ sender: Any) {
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    @IBAction func sendToKjuicer(_ sender: Any) {
        if self.sendButton.isEnabled{
            self.redirectToHost()
        }
    }
    
    func manageAttachments(){
        let content = extensionContext?.inputItems[0] as! NSExtensionItem
        let textContentType = kUTTypeText as String
        for attachment in content.attachments! {
            if attachment.hasItemConformingToTypeIdentifier(textContentType) {
                sendButton.isEnabled = true
                attachment.loadItem(forTypeIdentifier: textContentType, options: nil) {
                    data, error in
                    if error == nil {
                        let url = data as! NSURL
                        if let textData = NSData(contentsOf: url as URL) {
                            let datastring = NSString(data: textData as Data, encoding: String.Encoding.utf8.rawValue)
                            if let userDefaults = UserDefaults(suiteName: SharedKeys.appGroup.rawValue){
                                userDefaults.set(String(datastring!) as AnyObject, forKey: SharedKeys.textKey.rawValue)
                                self.textPreview.text = String(datastring!)
                            }
                        }
                    } else{
                        print(error as Any)
                    }
                }
            }else{
                textPreview.text = "Shared item doesn't conform to text type."
            }
        }
    }
    
    func redirectToHost(){
        var url:URL
        url = URL(string: "\(SharedKeys.shareUrl.rawValue)://dataUrl=\(SharedKeys.textKey.rawValue)")!
        print(url)
        var responder = self as UIResponder?
        let selectorOpenURL = sel_registerName("openURL:")
        while (responder != nil) {
            if (responder?.responds(to: selectorOpenURL))! {
                let _ = responder?.perform(selectorOpenURL, with: url)
            }
            responder = responder!.next
        }
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    func setUpUI(){
        textPreview.text = "Gathering your text... "
        sendButton.setTitle("", for: .disabled)
        sendButton.setTitle("Juice this Knowledge", for: .normal)
        sendButton.isEnabled = false
        cancelButton.setTitle("Cancel", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        manageAttachments()
    }
    
}
