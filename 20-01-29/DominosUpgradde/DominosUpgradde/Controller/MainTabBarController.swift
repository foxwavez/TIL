//
//  MainTabBarController.swift
//  DominosUpgradde
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryVC = UINavigationController(rootViewController: CategoryTableViewController())
        let sectionVC = UINavigationController(rootViewController: SectionViewController())
        let wishListVC = UINavigationController(rootViewController: WishListViewController())
        let jsonVC = UINavigationController(rootViewController: JasonViewController())
        
        categoryVC.tabBarItem = UITabBarItem(title: "Category", image: nil, tag: 0)
        sectionVC.tabBarItem = UITabBarItem(title: "Section", image: nil, tag: 0)
        wishListVC.tabBarItem = UITabBarItem(title: "WishList", image: nil, tag: 0)
        jsonVC.tabBarItem = UITabBarItem(title: "Json", image: nil, tag: 0)
        
        self.viewControllers = [categoryVC, sectionVC, wishListVC, jsonVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
