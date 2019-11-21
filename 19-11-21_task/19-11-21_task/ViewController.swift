//
//  ViewController.swift
//  19-11-21_task
//
//  Created by Hailey Lee on 2019/11/21.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stateLable: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        plusButton.setTitle("Plus", for: .normal) // 버튼에서 이름을 바꿀 때 setTitle이라는 함수를 쓴다
        minusButton.setTitle("Minus", for: .normal)
        
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        minusButton.addTarget(self, action: #selector(minusTouched(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func plusTouched(_ sender: UIButton) {
        print("Plus button touched")
        count = count + 1
        stateLable.text = "\(count)"
        stateLable.textColor = .systemBlue
        stateLable.backgroundColor = .black
    }
    @objc func minusTouched(_ sender: UIButton) {
        count -= 1
        print("Minus button touched")
        stateLable.text = "\(count)"
        stateLable.textColor = .systemRed
        stateLable.backgroundColor = .systemYellow

}

