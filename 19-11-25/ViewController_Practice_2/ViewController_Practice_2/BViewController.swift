//
//  BViewController.swift
//  ViewController_Practice_2
//
//  Created by Hailey Lee on 2019/11/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    var count = 0
    let label = UILabel()
    let plusButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        label.frame = CGRect(x: 70, y: 100, width: 200, height: 100)
        label.text = "\(count)"
        view.addSubview(label)
        
        plusButton.frame = CGRect(x: 0, y: 140, width: 200, height: 100)
        plusButton.setTitle("PLUS", for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 20)
        plusButton.addTarget(self, action: #selector(plusButtonTouched), for: .touchUpInside)
        view.addSubview(plusButton)
    }
    
    @objc func plusButtonTouched() {
        count = count + 1
        label.text = "\(count)"
        
        guard let goingBack = presentingViewController as? ViewController else { return }
        goingBack.count = count
        goingBack.label.text = "\(count)"
        
        dismiss(animated: true)
    }
}
