//
//  DetailViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    let imageView = UIImageView()
    let plusBtn = UIButton()
    let minusBtn = UIButton()
    let displayLable = UILabel()
   

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraint()
  }
    
    private func setupUI() {
        view.backgroundColor = .white
        [imageView, plusBtn, minusBtn, displayLable].forEach {
            view.addSubview($0)
        }
        
        
        plusBtn.setTitle("+", for: .normal)
        plusBtn.layer.borderColor = UIColor.darkGray.cgColor
        plusBtn.layer.borderWidth = 2
        plusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        plusBtn.setTitleColor(.darkGray, for: .normal)
//        self.view.addSubview(plusBtn)

        minusBtn.setTitle("-", for: .normal)
        minusBtn.layer.borderColor = UIColor.darkGray.cgColor
        minusBtn.layer.borderWidth = 2
        minusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        minusBtn.setTitleColor(.darkGray, for: .normal)
//        self.view.addSubview(minusBtn)
        
        displayLable.text = "\(0)개"
        displayLable.textColor = .white
        displayLable.textAlignment = .center
        displayLable.backgroundColor = .darkGray
//        self.view.addSubview(displayLable)
//        plusBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
    }
    
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor,constant: 50),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -260)
        ])
        
        minusBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusBtn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            minusBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 60),
            minusBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -290),
            minusBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -160)
        ])
        displayLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            displayLable.leadingAnchor.constraint(equalTo: minusBtn.trailingAnchor, constant: 0),
            displayLable.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -120),
            displayLable.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -160)
        ])
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusBtn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            plusBtn.leadingAnchor.constraint(equalTo: displayLable.trailingAnchor, constant: 0),
            plusBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -60),
            plusBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -160)
        ])
    }
    
   
    
}


//@objc private func btnAction(_ sender: UIButton) {
//    return 0
//}
