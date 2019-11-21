//
//  AppDelegate.swift
//  19-11-20school
//
//  Created by Hailey Lee on 2019/11/21.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // [ SceneDelegate 사용할 때 ]
    // 1. iOS 13 미만일 때 (현업이나 개인앱 낼 때)
    //   1) available 명시, AppDelegate에 window 프로퍼티 추가
    // 2. iOS 13 이상 + SceneDelegate 사용 기준 (공부할 때)
    //   1) AppDelegate랑 SceneDelegate 무시
    
    // [ SceneDelegate 사용하지 않을 때  (AppDelegate만 사용할 때) ]
    // 1. SceneDelegate 파일 삭제
    // 2. AppDelegate에서 Scene관련 메서드 삭제
    // 3. Info.plist에서 Application Scene Manifest 키 삭제
    
    // Xcode 10까지는 AppDelegate.swift가 기본값
    // Xcode 11부터 SceneDelegate.swift가 기본값

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//
}

func applicationDidBecomeActive(_ application: UIApplication) {
    print("applicationDidBecomeActive")
}

func applictionWillResignActive(_ application: UIApplication) {
    print("applictionWillResignActive")
}

func applicationDidEnterBackground(_ application: UIApplication) {
    print("applicationDidEnterBackground")
}

func applicationDidEnterForeground(_ application: UIApplication) {
    print("applicationDidEnterForeground")
}

func applicationWillTerminator(_ application: UIApplication) {
    print("WillTerminator")
}





