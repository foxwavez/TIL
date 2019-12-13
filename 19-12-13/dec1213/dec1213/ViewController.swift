//
//  ViewController.swift
//  dec1213
//
//  Created by macbook on 2019/12/13.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fastCampusView = UIImageView()
    var emailView = UIImageView()
    var secretView = UIImageView()

    var squareView1 = UIView()
    var squareView2 = UIView()
    var squareView3 = UIView()
    
    var emailTextField = UITextField()
    var secretTextField = UITextField()
    
    
    var signinButton = UIButton()
    
    let emailValue = "Email"
    let secretValue = "Secret"
    
    var emailLine = UIView()
    var secretLine = UIView()
    
    var moveView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        secretTextField.delegate = self
        
        moveView.backgroundColor = .white
        
        emailView.image = UIImage(named: "email")
        secretView.image = UIImage(named: "password")
        
        fastCampusView.image = UIImage(named: "fastcampus_logo")
        
        emailLine.backgroundColor = .black
        secretLine.backgroundColor = .black
   
        emailTextField.placeholder = "이메일을 입력해주세요"
        secretTextField.placeholder = "비밀번호 입력해주세요"
        
        squareView2.backgroundColor = .red
        squareView2.layer.cornerRadius = 5
        
        squareView1.backgroundColor = .red
        squareView1.layer.cornerRadius = 5
        
        squareView3.backgroundColor = .red
        squareView3.layer.cornerRadius = 5
        
        signinButton.backgroundColor = .gray
        signinButton.setTitleColor(.white, for: .normal)
        signinButton.setTitle("Sign In", for: .normal)
        signinButton.layer.cornerRadius = 10
        signinButton.addTarget(self, action: #selector(pushedButton(_:)), for: .touchUpInside)
        
        self.view.addSubview(moveView)
        
        moveView.addSubview(emailView)
        moveView.addSubview(secretView)
        moveView.addSubview(emailLine)
        moveView.addSubview(secretLine)
        moveView.addSubview(secretTextField)
        moveView.addSubview(emailTextField)
        
//        self.view.addSubview(emailTextField)
//        self.view.addSubview(secretTextField)
//
//        self.view.addSubview(secretLine)
//        self.view.addSubview(emailLine)
//
//        self.view.addSubview(emailView)
//        self.view.addSubview(secretView)
        
        self.view.addSubview(fastCampusView)
        self.view.addSubview(signinButton)
        self.view.addSubview(squareView1)
        self.view.addSubview(squareView2)
        self.view.addSubview(squareView3)

        
        
        activeLayoutAnchors()
    }
    
    var constraint: NSLayoutConstraint!
    
    private func activeLayoutAnchors() {
       
        moveView.translatesAutoresizingMaskIntoConstraints = false
        constraint = moveView.bottomAnchor.constraint(equalTo: signinButton.topAnchor, constant: -30)
        constraint.isActive = true
        
        moveView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        moveView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        moveView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        print(moveView.frame)
    
        fastCampusView.translatesAutoresizingMaskIntoConstraints = false
        fastCampusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        //        fastCampusView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        fastCampusView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        fastCampusView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
        fastCampusView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        squareView2.translatesAutoresizingMaskIntoConstraints = false
        squareView2.centerXAnchor.constraint(equalTo: fastCampusView.centerXAnchor).isActive = true
        squareView2.topAnchor.constraint(equalTo: fastCampusView.bottomAnchor, constant: 10).isActive = true
        squareView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        squareView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        squareView1.translatesAutoresizingMaskIntoConstraints = false
        squareView1.topAnchor.constraint(equalTo: fastCampusView.bottomAnchor, constant: 10).isActive = true
        squareView1.trailingAnchor.constraint(equalTo: squareView2.leadingAnchor, constant: -10).isActive = true
        squareView1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        squareView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        squareView3.translatesAutoresizingMaskIntoConstraints = false
        squareView3.topAnchor.constraint(equalTo: fastCampusView.bottomAnchor, constant: 10).isActive = true
        squareView3.leadingAnchor.constraint(equalTo: squareView2.trailingAnchor, constant: 10).isActive = true
        squareView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        squareView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        signinButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        signinButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        signinButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secretView.translatesAutoresizingMaskIntoConstraints = false
        secretView.leadingAnchor.constraint(equalTo: moveView.leadingAnchor, constant: 20).isActive = true
        secretView.bottomAnchor.constraint(equalTo: moveView.bottomAnchor, constant: -20).isActive = true
        secretView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        secretView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secretTextField.translatesAutoresizingMaskIntoConstraints = false
        secretTextField.leadingAnchor.constraint(equalTo: moveView.leadingAnchor, constant: 80).isActive = true
        secretTextField.bottomAnchor.constraint(equalTo: moveView.bottomAnchor, constant: -30).isActive = true
        secretTextField.trailingAnchor.constraint(equalTo: moveView.trailingAnchor, constant: -20).isActive = true
        
        secretLine.translatesAutoresizingMaskIntoConstraints = false
        secretLine.leadingAnchor.constraint(equalTo: moveView.leadingAnchor, constant: 60).isActive = true
        secretLine.bottomAnchor.constraint(equalTo: moveView.bottomAnchor, constant: -20).isActive = true
        secretLine.trailingAnchor.constraint(equalTo: moveView.trailingAnchor, constant: -30).isActive = true
        secretLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        emailView.translatesAutoresizingMaskIntoConstraints = false
        emailView.leadingAnchor.constraint(equalTo: moveView.leadingAnchor, constant: 20).isActive = true
        emailView.topAnchor.constraint(equalTo: moveView.topAnchor, constant: 40).isActive = true
        emailView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leadingAnchor.constraint(equalTo: moveView.leadingAnchor, constant: 80).isActive = true
        emailTextField.topAnchor.constraint(equalTo: moveView.topAnchor, constant: 40).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: moveView.trailingAnchor, constant: -20).isActive = true
        
        emailLine.translatesAutoresizingMaskIntoConstraints = false
        emailLine.leadingAnchor.constraint(equalTo: moveView.leadingAnchor, constant: 60).isActive = true
        emailLine.bottomAnchor.constraint(equalTo: moveView.topAnchor, constant: 70).isActive = true
        emailLine.trailingAnchor.constraint(equalTo: moveView.trailingAnchor, constant: -30).isActive = true
        emailLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    @objc func pushedButton (_ sender: UIButton) {
        let secondVC = SecondViewController()
        
        if emailTextField.text == emailValue && secretTextField.text == secretValue{
        
         present(secondVC, animated: true)
        }
        
        
        
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
           
           UIView.animate(withDuration: 1){
   //            self.moveView.center.y = 300
               self.constraint.constant = -300
           
           }
        
        print(moveView.frame)
        return true
    }
    

}


// UIWindow - Main - Login(FullScreen)
            
            
            // 원만드는법
    //        textView.layer.cornerRadius = 50
    //        UIView.animate(withDuration: 3){        }
    
    
    
    //신델리게이트를 이용하는방법

    //@IBAction private func didtapButton(_ sender: Any){
    //    if #available(iOS 13.0, *)
    //    if let  windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene{
    //        let window = UIWindow(windowScene: windowScene)
    //        window.rootViewcontroller = SecondViewController()
    //
    //        let sceneDelegate = windowScene.delegate as? SceneDelegate
    //        SceneDelegate?.window = window
    //        windwo.makeKeyAndVisible()
    //
    //    }
    //}

    


