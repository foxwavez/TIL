//
//  AppDelegate.swift
//  vidwController
//
//  Created by macbook on 2019/11/25.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {
            
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .white
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
            
            
        }
        return true
    }
}
