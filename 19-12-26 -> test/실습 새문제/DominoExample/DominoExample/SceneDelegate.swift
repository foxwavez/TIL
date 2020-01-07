//
//  SceneDelegate.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

@available(iOS 13.0, *) // iOS 13.0 버전 부터 SceneDelegate를 사용한다고 정의
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? //  코드를 작성할 경우 윈도우를 직접 생성해줘야 한다


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // ->
        //        guard let _ = (scene as? UIWindowScene) else { return } // 원래 디폴트로 있는 코드 1)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let orderVC = OrderViewController()
        let wishListVC = WishListController()
        // 만들어둔 뷰컨트롤러 인스턴스 생성을 해준다. 아래 rootViewController에 넣어주기 위해 5)
        
        let orderNaviVC = UINavigationController(rootViewController: orderVC)
        let wishNaviVC = UINavigationController(rootViewController:  wishListVC)
        // 네비게이션 컨트롤 화면을 만들어준다 4)
        // tabBarController.viewControllers = [] 빈 배열 안에 변수를 넣어줘야 하기 때문에 위에 작성해주어야 한다
        // 네비게이션 바는 rootController가 필요하다
        
        orderNaviVC.tabBarItem = UITabBarItem(title: "Domino's", image: nil, tag: 0)
        wishNaviVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, tag: 0)
        // 스토리보드 상에서 tabBar 안에서 navigtion 있고, 탭바를 선택했을 때 네비게이션도 바뀌어야 해서 6)
        
        let tabBarController = UITabBarController()
        // 탭바를 만들어 줄 때는 이거 코드를 작성해 주어야 한다. 3)
        tabBarController.viewControllers = [orderNaviVC, wishNaviVC]
        // viewControllers가 배열이라 빈 배열을 넣어준다
        
        
        // 스토리보드 없이 코드를 작성할 경우 윈도우를 생성해줘야 한다 2)
        window = UIWindow(windowScene: windowScene)
        // 윈도우를 만들어준 코드 / 가드렛에 다운 캐스팅해서 나온 친구를 넣어준다
        window?.rootViewController = tabBarController // ViewController() 대신에 처음뷰가 탭바라면 tabBarController 바꿔준다
        // 윈도우에 루트뷰컨트롤러를 정해주는 코드 / 첫화면에 나오는 VC 넣어준다
        window?.makeKeyAndVisible()
        // makeKeyAndVisible을 해줘야 위에서 내가 넣어준 것들이 화면에 보여진다
    
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

