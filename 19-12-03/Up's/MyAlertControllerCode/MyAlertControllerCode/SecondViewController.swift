//
//  SecondViewController.swift
//  MyAlertControllerCode
//
//  Created by Lee on 2019/12/03.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  private let baseView = UIView()
  private let titleLabel = UILabel()
  private let messageLabel = UILabel()
  private let contentTextField = UITextField()
  private let cancelButton = UIButton()
  private let enterButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    baseUI()
  }
  
  private func baseUI() {
    view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    
    let baseWidth = view.frame.width - 100
    let baseHeight = CGFloat(200)
    let itemHeight = CGFloat(50)
    let textFieldSpace = CGFloat(20)
    
    
    baseView.backgroundColor = .white
    baseView.frame.size = CGSize(width: baseWidth, height: baseHeight)
    baseView.center = CGPoint(x: view.center.x, y: 300)
    view.addSubview(baseView)
    
    titleLabel.text = "Title"
    titleLabel.textAlignment = .center
    titleLabel.frame = CGRect(x: 0, y: 0, width: baseWidth, height: itemHeight)
    baseView.addSubview(titleLabel)
    
    messageLabel.text = "message"
    messageLabel.textAlignment = .center
    messageLabel.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: baseWidth, height: itemHeight)
    baseView.addSubview(messageLabel)
    
    contentTextField.becomeFirstResponder()
    contentTextField.frame = CGRect(
      x: 0 + textFieldSpace,
      y: messageLabel.frame.maxY,
      width: baseWidth - (textFieldSpace * 2),
      height: itemHeight
    )
    contentTextField.borderStyle = .roundedRect
    baseView.addSubview(contentTextField)
    
    
    cancelButton.setTitle("Cancel", for: .normal)
    cancelButton.setTitleColor(.blue, for: .normal)
    cancelButton.frame = CGRect(x: 0, y: contentTextField.frame.maxY, width: baseWidth / 2, height: itemHeight)
    cancelButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    baseView.addSubview(cancelButton)
    
    enterButton.setTitle("Enter", for: .normal)
    enterButton.setTitleColor(.blue, for: .normal)
    enterButton.frame = CGRect(x: cancelButton.frame.maxX, y: cancelButton.frame.minY, width: baseWidth / 2, height: itemHeight)
    enterButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    baseView.addSubview(enterButton)
  }
  
  @objc private func buttonAction(_ sender: UIButton) {
    switch sender {
    case cancelButton:
      break
    default:
      guard let vc = presentingViewController as? FirstViewController else { return }
      vc.content = contentTextField.text ?? ""
      
      break
    }
    
    dismiss(animated: false)
  }
}
