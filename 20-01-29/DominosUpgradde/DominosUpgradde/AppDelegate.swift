//
//  AppDelegate.swift
//  DominosUpgradde
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // 탭바를 맨 처음 화면 부터 만들어 주기 위해 윈도우 생성
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 윈도우에 스크린을 만들어서 설정 메인탭바에 루트뷰컨트롤러 연결
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        return true
    }


}

