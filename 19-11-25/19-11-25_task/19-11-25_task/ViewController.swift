//
//  ViewController.swift
//  19-11-25_task
//
//  Created by Hailey Lee on 2019/11/25.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
        label.text = "Label"
        self.view.addSubview(label)
    }
    @objc private func countLabel(_ sender: UILabel) {
        let nextB = BViewController()
        present(nextB, animated: true)
    }

}
