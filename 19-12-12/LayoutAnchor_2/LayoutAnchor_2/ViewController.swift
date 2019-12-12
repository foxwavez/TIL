//
//  ViewController.swift
//  LayoutAnchor_2
//
//  Created by Hailey Lee on 2019/12/12.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewSafeAreaInsetsDidChange() {
        redView.backgroundColor = .red
        view.addSubview(redView)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        setUI()
    }
    private func setUI() {
        let margin:CGFloat = 20
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
        redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -10).isActive = true
        redView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 1).isActive = true
       
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
    }
    
}

