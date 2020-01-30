//
//  SceneDelegate.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow? // 스트리보드 말고 코드로 개발하려면 윈도우를 직접 작성해줘야 한다.

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    //
    
    let listVC = UINavigationController(rootViewController: ListViewController())
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [listVC, wishListVC]
    
    listVC.tabBarItem = UITabBarItem(title: "Domino's", image: UIImage(named: "domino's"), tag: 0)
    wishListVC.tabBarItem = UITabBarItem(title: "Wish", image: UIImage(named: "wishlist"), tag: 0)
    
    window = UIWindow(windowScene: windowScene)
    // 윈도우를 만들어준 코드 / windowScene 다운캐스팅한 친구를 넣어준다
    window?.rootViewController = tabBarController
    // 윈도우에 루트뷰컨트롤러를 정해주는 코드 / 첫화면에 나오는 VC 넣어준다 -> 스토리보드 entryPoint
    window?.makeKeyAndVisible()
    // makeKeyAndVisible를 해줘야 위에서 내가 넣어준 것들이 화면에 보여진다
    
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

