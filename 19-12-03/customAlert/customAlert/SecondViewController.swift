//
//  SecondViewController.swift
//  customAlert
//
//  Created by Hailey Lee on 2019/12/04.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let baseView = UIView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let textField = UITextField()
    let cancelButton = UIButton()
    let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseUI()
    }
    
    private func baseUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        
        let baseWidth = view.frame.width - 40
        let baseHeight = CGFloat(200)
        
        baseView.frame.size = CGSize(width: baseWidth, height: baseHeight)
        baseView.center = CGPoint(x: view.center.x, y: 300)
        baseView.backgroundColor = .white
        view.addSubview(baseView)
        
        titleLabel.text = "title"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.frame.size = CGSize(width: baseWidth, height: 50)
        titleLabel.frame.origin = CGPoint(x: 0, y: 0)
        baseView.addSubview(titleLabel)
    }

}
