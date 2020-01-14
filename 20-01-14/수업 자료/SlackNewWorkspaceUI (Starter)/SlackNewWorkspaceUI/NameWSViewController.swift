//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        naviItemSetUI()
        setUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder() // 화면 나오자마자 keyboard 나오게 하는 함수
    }
    private func setUI() {
        view.addSubview(textField)
//        textField.placeholder = "Name your workspace"
        textField.attributedPlaceholder = NSAttributedString(string: "Name your workspace", attributes: [.foregroundColor: UIColor.lightGray,
        .font: UIFont.boldSystemFont(ofSize: 20.0)])
        setupConstraint()
    }
    
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           textField.widthAnchor.constraint(equalToConstant: 360),
           textField.heightAnchor.constraint(equalToConstant: 50),
           textField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
           textField.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: -160)
        ])
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
