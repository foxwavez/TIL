//
//  ViewController.swift
//  NavigationController
//
//  Created by Hailey Lee on 2019/12/23.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // iOS 11 이상
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "FirstVC"
        view.backgroundColor = .yellow
        
        let barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController))
        
        let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
//        show(secondVC, sender: sender)
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //번들은 하나라고 생각하고 nil을 넣어주면 된다.
        let initalVC = storyboard.instantiateInitialViewController() //초기 뷰 컨트롤러(네비게이션 컨트롤)의 데이터를 가져오는 것
        let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        
//        show(secondVC, sender: nil)
//        present(secondVC, animated: true)
        
        print(navigationController)
//        navigationController?.pushViewController(secondVC, animated: true)
                
        
        
                
        //        let secondVC = SecondViewController()
        //        show(secondVC, sender: nil)
    }

}

