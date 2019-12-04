//
//  SecondViewController.swift
//  customAlert
//
//  Created by Hailey Lee on 2019/12/04.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let baseView = UIView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let textField = UITextField()
    let cancelButton = UIButton()
    let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseUI()
    }
    
    private func baseUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        
        let baseWidth = view.frame.width - 40
        let baseHeight = CGFloat(200)
        let itemHeight = CGFloat(50)
        
        baseView.frame.size = CGSize(width: baseWidth, height: baseHeight)
        baseView.center = CGPoint(x: view.center.x, y: 300)
        baseView.backgroundColor = .white
        view.addSubview(baseView)
        
        titleLabel.text = "title"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.frame.size = CGSize(width: baseWidth, height: itemHeight)
        titleLabel.frame.origin = CGPoint(x: 0, y: 0)
        baseView.addSubview(titleLabel)
        
        messageLabel.text = "message"
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: baseWidth, height: itemHeight)
        baseView.addSubview(messageLabel)
        
        textField.becomeFirstResponder()
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 20, y: messageLabel.frame.maxY, width: baseWidth - 40, height: itemHeight)
        baseView.addSubview(textField)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.frame = CGRect(
            x: 0, y: textField.frame.maxY,
            width: baseWidth / 2, height: itemHeight)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        baseView.addSubview(cancelButton)
        
        enterButton.setTitle("확인", for: .normal)
        enterButton.frame = CGRect(
            x: cancelButton.frame.maxX, y: textField.frame.maxY,
            width: baseWidth / 2, height: itemHeight)
        enterButton.setTitleColor(.systemBlue, for: .normal)
        enterButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        baseView.addSubview(enterButton)
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        guard let firstVC = presentingViewController as? FirstViewController else { return }
        firstVC.displayLabel.text = ""
        dismiss(animated: false)
    }

}
