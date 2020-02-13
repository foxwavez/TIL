//
//  referViewController.swift
//  FirebasePractice
//
//  Created by Hailey Lee on 2020/02/12.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import FirebaseDatabase

class referViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var userIDValueLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthValueLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        nameTextField.placeholder = "홍길동"
    }
    
    @IBAction func didTabConfirmButton(_ sender: Any) {
    }
    
    @IBAction func didTabDeleteButton(_ sender: Any) {
    }
    
}
