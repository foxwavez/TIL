//
//  ViewController.swift
//  LoginViewPractice
//
//  Created by Hailey Lee on 2019/12/13.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var rectangle1: UIView!
    @IBOutlet weak var rectangle2: UIView!
    @IBOutlet weak var rectangle3: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var emailFieild: UITextField!
    @IBOutlet weak var pwFeild: UITextField!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var pwImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewSafeAreaInsetsDidChange() {
        setUI()
    }
    
    private func setUI() {
        logoImg.image = UIImage(named: "fastcampus_logo")
        emailImg.image = UIImage(named: "email")
        pwImg.image = UIImage(named: "password")
        let radius:CGFloat = 6
        rectangle1.layer.cornerRadius = radius
        rectangle2.layer.cornerRadius = radius
        rectangle3.layer.cornerRadius = radius
        signInBtn.backgroundColor = .darkGray
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.layer.cornerRadius = radius
        
        emailFieild.placeholder = "이메일을 입력하세요"
        pwFeild.placeholder = "비밀번호를 입력하세요"
        
        
//        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize:    )
        view.addSubview(signInBtn)
       
    }

}

