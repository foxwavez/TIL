//
//  ViewController.swift
//  UIController_Practice_3
//
//  Created by Hailey Lee on 2019/11/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit
    var count = 0
    let label = UILabel()
    let plusButton = UIButton(type: .system)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = CGRect(x: 90, y: 100, width: 200, height: 100)
        label.text = "\(count)"
        view.addSubview(label)
        plusButton.frame = CGRect(x: 10, y: 140, width: 200, height: 100)
        plusButton.setTitle("Plus", for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonTouched), for: .touchUpInside)
        plusButton.titleLabel?.font = .systemFont(ofSize: 20)
        view.addSubview(plusButton)
        
    }
    @objc func plusButtonTouched() {
        count = count + 1
        label.text = "\(count)"
        
        let
    }

}

