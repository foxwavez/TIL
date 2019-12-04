//
//  ViewController.swift
//  customAlert
//
//  Created by Hailey Lee on 2019/12/04.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let displayLabel = UILabel()
    let alertButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseUI()
    }
    private func baseUI() {
        view.backgroundColor = .white
        
        displayLabel.text = "뭐가 나올까요?"
        displayLabel.textColor = .white
        displayLabel.textAlignment = .center
        displayLabel.frame.size = CGSize(width: 200, height: 40)
        displayLabel.center = CGPoint(x: view.center.x, y: 200)
        displayLabel.backgroundColor = .black
        view.addSubview(displayLabel)
        
        alertButton.setTitle("눌러보세요", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.frame.size = CGSize(width: 200, height: 40)
        alertButton.center = CGPoint(x: view.center.x, y: 400)
        alertButton.backgroundColor = .systemTeal
        alertButton.addTarget(self, action: #selector(alertButtonTouched), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    @objc private func alertButtonTouched() {
        
        let secondVC = SecondViewController()
//        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalPresentationStyle = .overFullScreen
        present(secondVC, animated: false)
    }
}

