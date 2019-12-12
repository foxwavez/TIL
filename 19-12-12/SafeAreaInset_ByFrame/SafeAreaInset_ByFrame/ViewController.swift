//
//  ViewController.swift
//  SafeAreaInset_ByFrame
//
//  Created by Hailey Lee on 2019/12/12.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewSafeAreaInsetsDidChange() {
        setUI()
        // iPhone8 ( 20, 0, 0, 0)
        // iPhoneX ( 44, 0, 34, 0)
        // viewWillAppear -> viewSafeAreaInsetsDidChange -> viewWillLayOutSubviews -> viewDidLayOutSubviews -> viewDidAppear
    }
    private func setUI() {
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safe = view.safeAreaInsets
        let width = (view.frame.width / 2) - (safe.left + margin) - (padding /
            2)
        let height = view.frame.height - (safe.top + margin) - (safe.bottom + margin)
        
        redView.frame = CGRect(x: safe.left + margin, y: safe.top + margin, width: width, height: height)
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        blueView.frame = CGRect(x: redView.frame.maxX + padding, y: safe.top + margin, width: width, height: height)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
    }

}

