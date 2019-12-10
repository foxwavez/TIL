//
//  ViewController.swift
//  TextFieldDelegateExample
//
//  Created by Hailey Lee on 2019/12/10.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // 텍스트 필드는 딜리게이트가 사용하겠다
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.text {
            // textField.text가 현재 옵셔널타입이지만
            // 비교하는 거는 옵셔널 바인딩을 안해줘도 된다
            // 하지만 guard let으로 옵셔널 바인딩을 해주는 게 좋다
        case "red":
            myView.backgroundColor = .red
        case "blue":
            myView.backgroundColor = .blue
        case "black":
            myView.backgroundColor = .black
        default:
            myView.backgroundColor = .gray
        }
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string == "z" ? false : true
        // z를 누르면 텍스트필드에 z가 나오지 않는다
    }
}
