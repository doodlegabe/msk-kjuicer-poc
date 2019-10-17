//
//  AppDelegate.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/17/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
}

extension AppDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
          print("extension eorking")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = storyboard.instantiateViewController(withIdentifier: "EditorViewController")
        
        self.window?.rootViewController = homeVC
        
        print(homeVC)
        
//        if let textData = UserDefaults(suiteName: SharedKeys.appGroup.rawValue)!.object(forKey: SharedKeys.textKey.rawValue) as? String {
//            homeVC.handleInComingText(text: textData)
//            print("call main")
//        }
        return true
    }
}
