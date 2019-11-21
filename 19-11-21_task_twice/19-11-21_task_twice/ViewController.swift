//
//  ViewController.swift
//  19-11-21_task_twice
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
        // Do any additional setup after loading the view.
    }
    @IBAction func plusTouched(_ sender: UIButton) {
        print("플러스 버튼을 눌렀지")
        count = count + 1
        stateLabel.text = "\(count)"
        stateLabel.textColor = .systemBlue
    }
    @IBAction func minusTouched(_ sender: UIButton) {
        print("마이너스 버튼을 눌렀지")
        count = count - 1
        stateLabel.text = "\(count)"
        stateLabel.textColor = .systemRed
    }
    

}

