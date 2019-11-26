//
//  ViewController.swift
//  19-11-25_task
//
//  Created by Hailey Lee on 2019/11/25.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    let label = UILabel()
    let button = UIButton(type: .system)
    func setupUI() {
        if #available(iOS 13.0, *) {
             view.backgroundColor = .systemBackground
           } else {
             view.backgroundColor = .white
           }
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
        label.text = "\(count)"
        self.view.addSubview(label)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(nextViewButton(_:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc private func nextViewButton(_ sender: UIButton) {
        let nextB = BViewController()
        present(nextB, animated: true)
        count = count + 1
        label.text = "\(count)"
    }

}
