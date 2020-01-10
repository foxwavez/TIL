//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Hailey Lee on 2020/01/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setupConstraint()
    }
    
    private func setUI() {
        button.setTitle("button", for: .normal)
        button
    }
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: guide.topAnchor,constant: <#Int#>),
            button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: <#Int#>),
            button.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: <#Int#>),
            button.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: <#Int#>)
        ])
    }

}

