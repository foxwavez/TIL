//
//  AppDelegate.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

//  1. 탭바컨트롤러
//
//   - ListViewController 와 WishListViewController 설정 (o)
//
//
//  2. ListViewController
//
//   - TableView
//     - 기본 셀(style: subtitle) 사용 ( o )
//     - 테이블뷰 데이터 매칭 (  ) 
//
//
//  3. DetailViewController
//
//   - NavigationController
//     - 타이틀 ( o )
//
//   - View
//     - 이미지 매칭 (  )
//     - 버튼 기능 ( ^ ) -> 버튼만 나옴
//
//
//  4. WishListViewController
//
//   - NavigationController
//     - 목록 지우기 기능 (  )
//     - 주문 기능 (  )
//
//   - TableView
//     - 기본 셀(style: subtitle) 사용 (  )
//     - 주문 목록 데이터 매칭 (  )
