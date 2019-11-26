//
//  ViewController.swift
//  UITextViewExample
//
//  Created by Hailey Lee on 2019/11/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextFeild.becomeFirstResponder()
        
        idTextFeild.font = UIFont.systemFont(ofSize: 20)
        idTextFeild.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        idTextFeild.font = UIFont.boldSystemFont(ofSize: 30)
        idTextFeild.font = UIFont.preferredFont(forTextStyle: .caption1)
        idTextFeild.borderStyle = .none
        idTextFeild.textAlignment = .center
        idTextFeild.keyboardType = .URL
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        idTextFeild.becomeFirstResponder()
    }


   
    @IBAction func textFeildEditingDidBegin(_ sender: UITextField) {
        print("textFeildEitingDidBegin")
        
//        if let ft = sender as? UITextField {
//
//        }
//
        if sender.tag == 0 {
            print("idTextFeild")
        } else if sender.tag == 1 {
            print("passwordTextFeild")
        } else {
            print("confirmPassword")
        }
        
    } // 텍스트 필드에 커서가 잡힐 때
    
    @IBAction func textFieldEditingChange(_ sender: UITextField) {
        print(sender.text ?? "")
        
        if sender.text!.count > 6 {
            sender.resignFirstResponder()
        } //resignFirstResponder()는 키보드를 내리는 역할
        // view.endEditing(true) // 뷰에 있는 뭐든 애들한테 키보드를 내리는 역할
    } // 텍스트를 Character를 입력할 때
    
    @IBAction func textFeildPrimaryActionTriggered(_ sender: UITextField) {
        print("textFeildPrimaryActionTriggered")
        if true {
            sender.resignFirstResponder()
        }
    } // 엔터, 리턴을 했을 때 텍스트 필드 안에서 있는 내용을 확인하고 알렛창이라던지 제안을 하게 작업해주는
    
    @IBAction func textFeildEditingDidEnd(_ sender: Any) {
        print("textFeildEditingDidEnd")
    }
    // 다른 텍스트 필드로 이동했을 때
    
    @IBAction func textFeildDidEndOnExit(_ sender: Any) {
        print("textFeildDidEndOnExit")
       }
} // 엔터, 리턴을 했을 때 키보드 창을 아예 꺼버리는 자체

