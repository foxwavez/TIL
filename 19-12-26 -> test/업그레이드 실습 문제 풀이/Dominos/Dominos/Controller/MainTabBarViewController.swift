//
//  MainTabBarViewController.swift
//  Dominos
//
//  Created by Lee on 2020/01/29.
//  Copyright © 2020 Up's. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let categoryVC = UINavigationController(rootViewController: CategoryTableViewController())
    let sectionVC = UINavigationController(rootViewController: SectionViewController())
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    categoryVC.tabBarItem = UITabBarItem(title: "Category", image: nil, tag: 0)
    sectionVC.tabBarItem = UITabBarItem(title: "Section", image: nil, tag: 0)
    wishListVC.tabBarItem = UITabBarItem(title: "WishList", image: nil, tag: 0)
    
    viewControllers = [categoryVC, sectionVC, wishListVC]
  }
}
