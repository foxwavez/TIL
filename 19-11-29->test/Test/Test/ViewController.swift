//
//  ViewController.swift
//  Test
//
//  Created by Hailey Lee on 2019/11/27.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    let label = UILabel()
    let nextButton = UIButton(type: .system)
    let textFeild = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        baseUI()
        
    }
    private func baseUI() {
        view.backgroundColor = .white
        label.frame = CGRect(x: 20, y: 100, width: 200, height: 100)
        label.text = "Label"
        view.addSubview(label)
        nextButton.setTitle("button", for: .normal)
        nextButton.frame = CGRect(x: 10, y: 10, width: 200, height: 100)
        nextButton.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        view.addSubview(nextButton)
        
        textFeild.frame = CGRect(x: 20, y: 100, width: 380, height: 40)
        textFeild.placeholder = "여기 있다"
        textFeild.borderStyle = .roundedRect
        textFeild.addTarget(self, action: #selector(tfAction), for: .editingDidEndOnExit)
        view.addSubview(textFeild)
    }

    @objc func nextButtonTouched() {
        count = count + 1
        label.text = "\(count)"
    }
    @objc func tfAction() {
        
    }
}

