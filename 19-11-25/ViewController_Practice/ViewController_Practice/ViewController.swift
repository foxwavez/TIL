//
//  ViewController.swift
//  ViewController_Practice
//
//  Created by Hailey Lee on 2019/11/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var aCount = 0
    let aLabel = UILabel()
    let plusButton = UIButton()

    override func viewDidLoad() {
        self.view.backgroundColor = .yellow
        super.viewDidLoad()
        aLabel.frame = CGRect(x: 40, y: 100, width: 200, height: 100)
        aLabel.text = "\(aCount)"
        self.view.addSubview(aLabel)
        
        plusButton.frame = CGRect(x: 40, y: 140, width: 200, height: 100)
        plusButton.addTarget(self, action: #selector(plusButtonTouched), for: .touchUpInside)
        plusButton.setTitleColor(.systemBlue, for: .normal)
        plusButton.setTitle("PLUS", for: .normal)
        self.view.addSubview(plusButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func plusButtonTouched() {
        aCount = aCount + 1
//        aLabel.text = "\(aCount)"
        let bView = BViewController()
        bView.bCount = aCount
        present(bView, animated: true)
    }

}

