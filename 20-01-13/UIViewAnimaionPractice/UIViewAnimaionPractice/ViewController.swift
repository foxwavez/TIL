//
//  ViewController.swift
//  UIViewAnimaionPractice
//
//  Created by Hailey Lee on 2020/01/13.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var leftBtn = UIButton()
    private let colors = [#colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0, green: 0.6980392157, blue: 0.662745098, alpha: 1), #colorLiteral(red: 0.4235294118, green: 0.7607843137, blue: 0.2901960784, alpha: 1), #colorLiteral(red: 0.5921568627, green: 0.8431372549, blue: 0, alpha: 1), #colorLiteral(red: 0.8156862745, green: 0.8745098039, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.8196078431, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.4039215686, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0.8549019608, green: 0.1607843137, blue: 0.1098039216, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    private func setUI() {
        leftBtn = self.btnStyle(title: "버튼 0")
        leftBtn.frame.origin = CGPoint(x: 60, y: 740)
        [leftBtn].forEach {
        view.addSubview($0)
        }
    }
    
    private func btnStyle(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = colors.randomElement()
        button.frame.size = CGSize(width: 60, height: 60)
        button.layer.cornerRadius = button.bounds.size.width / 2
        return button
    }

}

