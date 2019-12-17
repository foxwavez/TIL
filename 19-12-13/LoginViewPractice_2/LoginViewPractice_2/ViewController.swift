//
//  ViewController.swift
//  LoginViewPractice_2
//
//  Created by Hailey Lee on 2019/12/15.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var logoImg = UIImageView()
    var container = UIView()
    var emailImg = UIImageView()
    var pwImg = UIImageView()
    var emailField = UITextField()
    var pwField = UITextField()
    var signBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewSafeAreaInsetsDidChange() {
        logoImg.image = UIImage(named: "fastcampus_logo")
        view.addSubview(logoImg)
        container.backgroundColor = .yellow
        view.addSubview(container)
        emailImg.image = UIImage(named: "email")
        view.addSubview(emailImg)
        setUI()
    }
    
    private func setUI() {
        
        // MARK: - logoImg
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        logoImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logoImg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        logoImg.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
        logoImg.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        // MARK: - container
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        container.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 40).isActive = true
        container.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        container.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        
        // MARK: - emailImg
        
        
    }
    

}

