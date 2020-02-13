//
//  ViewController.swift
//  FirebasePractice
//
//  Created by Hailey Lee on 2020/02/12.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAnalytics

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var entryButton: UIButton!
    @IBOutlet weak var referButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    private func setupUI() {
        nameTextField.placeholder = "홍길동"
        birthTextField.placeholder = "2000.01.14"
        emailTextField.placeholder = "email@adress.com"
        navigationController?.title = "입력하기"
    }

    @IBAction func didTabEntryButton(_ sender: Any) {
        
    }
    
    @IBAction func didTabReferButton(_ sender: Any) {
        
    }
}

