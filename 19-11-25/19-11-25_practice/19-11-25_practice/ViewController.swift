//
//  ViewController.swift
//  19-11-25_practice
//
//  Created by Hailey Lee on 2019/11/25.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 10
    var strong = 1
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var windStrong: UILabel!
    @IBOutlet weak var strongButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temperature.text = "10도"
        plusButton.setTitle("Plus", for: .normal)
        minusButton.setTitle("Minus", for: .normal)
        plusButton.addTarget(self, action: #selector(plusTouched(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusTouched(_:)), for: .touchUpInside)
        windStrong.text = "1단"
        strongButton.setTitle("바람세기", for: .normal)
        strongButton.addTarget(self, action: #selector(strongTouched(_:)), for: .touchUpInside)
    }
    @objc func plusTouched(_ sender: UIButton) {
        count = count + 1
        temperature.text = "\(count)도"
    }
    @objc func minusTouched(_ sender: UIButton) {
        count = count - 1
        temperature.text = "\(count)도"
    }
    @objc func strongTouched(_ sender: UIButton) {
        switch strong  {
        case 1 :
            strong = strong + 1
        case 2 :
            strong = strong + 1
        default:
            strong = 1
        }
        windStrong.text = "\(strong)단"
    }
}

