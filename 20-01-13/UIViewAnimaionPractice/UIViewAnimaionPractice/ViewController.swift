//
//  ViewController.swift
//  UIViewAnimaionPractice
//
//  Created by Hailey Lee on 2020/01/13.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let btn0 = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.addSubview(btn0)
    }
    
    private func setUI() {
        btn0.setTitle("버튼 0", for: .normal)
        btn0.backgroundColor = .black
        btn0.frame = CGRect(x: 60, y: 740, width: 60, height: 60)
        btn0.layer.cornerRadius = btn0.bounds.size.width / 2
    }

}

