//
//  AppDelegate.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // ->
    var window: UIWindow? // 이거를 작성해 줘야 한다

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // -> 2) SceneDelegate에 작성 했던 것을 똑같이 붙여넣기 하면 iOS 12.0 버전을 대응할 수 있다
        let orderVC = OrderViewController()
        let wishListVC = WishListController()
        
        let orderNaviVC = UINavigationController(rootViewController: orderVC)
        let wishNaviVC = UINavigationController(rootViewController:wishListVC)
        
        orderNaviVC.tabBarItem = UITabBarItem(title: "Domino's", image: nil, tag: 0)
        wishNaviVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [orderNaviVC, wishNaviVC]
        
        
        // -> 1)
        if #available(iOS 13.0 , *) { } // 중괄호 안에는 아무것도 넣지 않는다
            // if로 availabel을 쓸 땐 #을 작성
        else {
        window = UIWindow(frame: UIScreen.main.bounds)
        // AppDelegate는 frame으로 윈도우 크기를 잡아준다
        // UIScreen을 하면 내가 가진 디바이스 크기만하게 윈도우를 만들어준다
        // bounds는 수퍼클래스의 크기를 따르는 특성을 가지고 있다
//        window?.rootViewController = ViewController() 
        // 윈도우에 루트뷰컨트롤러를 정해주는 코드 / 첫화면에 나오는 VC 넣어준다
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        // makeKeyAndVisible을 해줘야 위에서 내가 넣어준 것들이 화면에 보여진다
            
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    // ->
    @available(iOS 13.0, *) // iOS 13.0 버전 부터 SceneDelegate를 사용한다고 정의
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    // ->
    @available(iOS 13.0, *) // iOS 13.0 버전 부터 SceneDelegate를 사용한다고 정의
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

