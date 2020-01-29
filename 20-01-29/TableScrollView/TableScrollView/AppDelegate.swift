//
//  AppDelegate.swift
//  TableScrollView
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBar = UITabBarController()
        
        let tableVC = TableViewController()
        let scrollVC = ScrollViewController()
        tableVC.tabBarItem = UITabBarItem(title: "TableView", image: nil, tag: 0)
        scrollVC.tabBarItem = UITabBarItem(title: "ScrollView", image: nil, tag: 0)
        
        tabBar.viewControllers = [tableVC, scrollVC]
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        return true
    }

    

}

