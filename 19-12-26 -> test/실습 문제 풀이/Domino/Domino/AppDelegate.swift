//
//  AppDelegate.swift
//  Domino
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let listVC = UINavigationController(rootViewController: ListViewController())
    listVC.tabBarItem = UITabBarItem(title: "Domino's", image: UIImage(named: "domino's"), tag: 0)
    
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    wishListVC.tabBarItem = UITabBarItem(title: "Wish List", image: UIImage(named: "wishlist"), tag: 1)
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [listVC, wishListVC]
    
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
    
    return true
  }

}

