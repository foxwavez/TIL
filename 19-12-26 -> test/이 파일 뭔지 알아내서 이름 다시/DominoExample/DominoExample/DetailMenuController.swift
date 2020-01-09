//
//  DetailMenuController.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class DetailMenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    var menu: Menu?
    
    let imageView = UIImageView()
    let addButton = UIButton(type: .system)
    let subButton = UIButton(type: .system)
    let displayLabel = UILabel()
    let stackView = UIStackView()
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        imageView.image = UIImage(named: menu?.thumbnail ?? "")
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        for view in [subButton, displayLabel, addButton] {
            stackView.addArrangedSubview(view) //StackView 추가할 때 쓰이는 함수 addSubview대신
        }
        self.view.addSubview(stackView)
        
        displayLabel.text =  "\(count) 개"
        displayLabel.textAlignment = .center
        displayLabel.backgroundColor = .gray
        
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 24)
        addButton.addTarget(self, action: #selector(countTouched(_:)), for: .touchUpInside)
        
        subButton.setTitle("-", for: .normal)
        subButton.titleLabel?.font = .systemFont(ofSize: 24)
        subButton.addTarget(self, action: #selector(countTouched(_:)), for: .touchUpInside)
    
        setupConstraint()
        
    }
    
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: guide.widthAnchor, constant:  1)
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant:  -40),
            stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    var count = 0 {
        didSet {
            displayLabel.text = "\(count)개"
        }
    }
    
    
    @objc private func countTouched(_ sender: UIButton) {
        if sender.currentTitle == "+" {
           count = count + 1
        } else {
            count = (count == 0) ? count : (count - 1)
        }
    }

}
