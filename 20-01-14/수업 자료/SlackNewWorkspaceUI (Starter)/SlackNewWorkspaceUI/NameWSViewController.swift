//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    /*
     "hello" as NSString.size
     -> 스트링 길이 계산
     */
    
    
    let TextField = UITextField()
    let placeholderLabel = UILabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        naviItemSetUI()
        setUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TextField.becomeFirstResponder() // 화면 나오자마자 keyboard 나오게 하는 함수
    }
    private func setUI() {
        [TextField, placeholderLabel].forEach {
            view.addSubview($0)
        }

//        textField.placeholder = "Name your workspace"
        TextField.attributedPlaceholder = NSAttributedString(string: "Name your workspace", attributes: [.foregroundColor: UIColor.lightGray,
        .font: UIFont.boldSystemFont(ofSize: 20.0)])
        
        TextField.delegate = self
        placeholderLabel.alpha = 0
        placeholderLabel.text = "Name your workspace"
        setupConstraint()
    }
    
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        
        TextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           TextField.widthAnchor.constraint(equalToConstant: 360),
           TextField.heightAnchor.constraint(equalToConstant: 50),
           TextField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
           TextField.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: -160)
        ])
        
//        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//           placeholderLabel.widthAnchor.constraint(equalToConstant: 360),
//           placeholderLabel.heightAnchor.constraint(equalToConstant: 50),
//           placeholderLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
//           placeholderLabel.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: -160)
//        ])
        placeholderLabel.frame = CGRect(x: 24, y: 296, width: 200, height: 40)
    }
    
    private func naviItemSetUI() {
        self.navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(closeAction))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextAction))
        navigationItem.rightBarButtonItem?.tintColor = .lightGray
    
    }
    
    @objc private func closeAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func nextAction() {
        let urlVC = UrlWSViewController()
        navigationController?.pushViewController(urlVC, animated: true)
    }
    
    
}

extension NameWSViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if text.isEmpty {
            // 텍스트 필드에 텍스트가 비어있을 때 실행되는 코드
            UIView.animate(withDuration: 0.6) {
                self.placeholderLabel.center.y = self.TextField.center.y
                self.placeholderLabel.alpha = 0
                self.navigationItem.rightBarButtonItem?.tintColor = .lightGray
            }
        } else {
            // 텍스트 필드에 텍스트가 하나라도 입력되었을 때 실행되는 코드
            UIView.animate(withDuration: 0.6) {
                self.placeholderLabel.center.y = self.TextField.center.y - 40
                self.placeholderLabel.alpha = 1
                self.navigationItem.rightBarButtonItem?.tintColor = .systemBlue

            }
                
        }
    }
    
}

