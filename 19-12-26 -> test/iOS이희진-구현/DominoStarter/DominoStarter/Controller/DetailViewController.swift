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
    var plusBtn = UIButton()
    var minusBtn = UIButton()
    let displayLable = UILabel()
    var count :Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraint()
  }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        plusBtn = self.btnStyle(title: "+")

        minusBtn = self.btnStyle(title: "-")

        
        displayLable.text = "\(count)개"
        displayLable.textColor = .white
        displayLable.textAlignment = .center
        displayLable.backgroundColor = .darkGray
//        self.view.addSubview(displayLable)
        plusBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        minusBtn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        
        [imageView, plusBtn, minusBtn, displayLable].forEach {
                   view.addSubview($0)
               }
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
    
   private func btnStyle(title: String) -> UIButton {
          let button = UIButton()
          button.layer.borderColor = UIColor.darkGray.cgColor
          button.layer.borderWidth = 2
          button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
          button.setTitleColor(.darkGray, for: .normal)
          button.setTitle(title, for: .normal)
          
          return button
      }
    @objc private func btnAction(_ sender: UIButton) {
        switch sender {
        case plusBtn:
            count = count + 1
            displayLable.text = "\(count)개"
        case minusBtn:
            guard count > 0 else { return }
            count = count - 1
            displayLable.text = "\(count)개"
        default:
            break
        }
    }
}



