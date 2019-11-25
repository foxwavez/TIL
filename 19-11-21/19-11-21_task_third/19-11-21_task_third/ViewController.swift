//
//  ViewController.swift
//  19-11-21_task_third
//
//  Created by Hailey Lee on 2019/11/21.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.setTitle("Plus", for: .normal)
        minusButton.setTitle("Minus", for: .normal)
        stateLabel.text = "0"
        
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        
        plusButton.frame.size.width = 100
        minusButton.frame.size.width = 100
        
        stateLabel.font = UIFont.systemFont(ofSize: 72)
        stateLabel.frame = CGRect(x: 32, y: 360, width: 360, height: 100)
        plusButton.addTarget(self, action: #selector(plusTouched(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusTouched(_:)), for: .touchUpInside)
        
    }
    @objc func plusTouched(_ sender: UIButton) {
        count = count + 1
        stateLabel.text = "\(count)"
        stateLabel.textColor = .systemBlue
    }
    @objc func minusTouched(_ sender: UIButton) {
        count -= 1
        stateLabel.text = "\(count)"
        stateLabel.textColor = .systemRed
    }
    
}

