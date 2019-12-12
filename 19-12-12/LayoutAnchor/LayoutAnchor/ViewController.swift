//
//  ViewController.swift
//  LayoutAnchor
//
//  Created by Hailey Lee on 2019/12/12.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let redView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewSafeAreaInsetsDidChange() {
        redView.backgroundColor = .red
        view.addSubview(redView)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        setUI()
    }
    
    private func setUI() {
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -padding).isActive = true
        redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -padding).isActive = true
        redView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 1).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 1).isActive = true
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin).isActive = true
        blueView.bottomAnchor.constraint(equalTo: greenView.topAnchor, constant: -padding).isActive = true
        blueView.heightAnchor.constraint(equalTo: greenView.heightAnchor, multiplier: 1).isActive = true
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1).isActive = true
        
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: padding).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: -padding).isActive = true
        yellowView.widthAnchor.constraint(equalTo: greenView.widthAnchor, multiplier: 1).isActive = true
        
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin).isActive = true
        greenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true

    }
}

