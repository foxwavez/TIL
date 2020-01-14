//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    
    let texField = UITextField()
    
    override func viewDidLoad() {
     setUI()
        view.backgroundColor = .white
        
    }
    private func setUI() {
        self.navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(closeAction))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextAction))
        navigationItem.rightBarButtonItem?.tintColor = .lightGray
    
    }
    
    @objc private func closeAction() {
        
    }
    
    @objc private func nextAction() {
    
    }
    
    
}
