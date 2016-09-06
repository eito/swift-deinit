//
//  AppDelegate.swift
//  deinit
//
//  Created by Eric Ito on 9/5/16.
//  Copyright © 2016 Eric Ito. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func applicationDidFinishLaunching(_ application: UIApplication) {
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        window?.rootViewController = UINavigationController(rootViewController: window!.rootViewController!)
        
        return true
    }

}

