//
//  BViewController.swift
//  ViewController_Practice
//
//  Created by Hailey Lee on 2019/11/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    var bCount = 0
    let bLabel = UILabel()
    let plusButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        bLabel.frame = CGRect(x: 40, y: 100, width: 200, height: 100)
        bLabel.text = "\(bCount)"
        self.view.addSubview(bLabel)
        
        plusButton.frame = CGRect(x: 40, y: 140, width: 200, height: 100)
        plusButton.addTarget(self, action: #selector(plusButtonTouched), for: .touchUpInside)
        plusButton.setTitleColor(.systemBlue, for: .normal)
        plusButton.setTitle("PLUS", for: .normal)
        self.view.addSubview(plusButton)
        // Do any additional setup after loading the view.
    }
    @objc func plusButtonTouched() {
           bCount = bCount + 1
           bLabel.text = "\(bCount)"
        guard let vc = presentingViewController as? ViewController else { return }
        vc.plusButton.setTitle("PLUS", for: .normal)
        vc.aCount = bCount
        vc.aLabel.text = "\(bCount)"
        
        dismiss(animated: true)
    }
}
