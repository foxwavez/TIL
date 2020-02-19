//
//  ViewController.swift
//  FirebasePractice
//
//  Created by Hailey Lee on 2020/02/12.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAnalytics
//import FirebaseRemoteConfig
import FirebaseUI

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
//    var remoteConfig: RemoteConfig!
    
    weak var authUI: FUIAuth?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var entryButton: UIButton!
    @IBOutlet weak var referButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
        
        self.ref = Database.database().reference()
        
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        authUI?.providers = [FUIGoogleAuth(), FUIEmailAuth()]
        authUI?.shouldHideCancelButton = true
        
        guard let authViewControleller = authUI?.authViewController() else {
            return
        }
        authViewControleller.modalPresentationStyle = .fullScreen
        
        self.present(authViewControleller, animated: true, completion: nil)
    }
    
    private func setupUI() {
        nameTextField.placeholder = "홍길동"
        birthTextField.placeholder = "2000.01.14"
        emailTextField.placeholder = "email@adress.com"
        navigationController?.title = "입력하기"
    }
    private func saveInfo() {
        // MARK: Firebase Database에 새로운 내용을 입력합니다.
        guard let name = nameTextField.text,
            let email = emailTextField.text else {
                return
        }
        let birthday = birthTextField.text ?? ""
        
        let userInfo = [
            "name": name,
            "birthday": birthday,
            "email": email
        ]
        
        self.ref
        .child("users")
        .childByAutoId()
            .setValue(userInfo) { [weak self] error, _ in
                if let error = error {
                    print("error")
                } else {
                    self?.statusLabel.text = "데이터가 성공적으로 저장되었습니다."
                }
        }
    }

    @IBAction func didTabEntryButton(_ sender: Any) {
        saveInfo()
        Analytics.logEvent("버튼버튼", parameters: ["아무거나": 1, "기기": UIDevice.current.name])
        Analytics.logEvent("입력하기_버튼_클릭", parameters: ["Device": UIDevice.current.name])
    }
    
    @IBAction func didTabReferButton(_ sender: Any) {
        
    }
    
    private func eamilSignInCheck() {
    
    }
}

extension ViewController: FUIAuthDelegate {
    
}
