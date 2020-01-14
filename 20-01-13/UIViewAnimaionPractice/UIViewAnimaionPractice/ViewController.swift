//
//  ViewController.swift
//  UIViewAnimaionPractice
//
//  Created by Hailey Lee on 2020/01/13.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let itemHeight: CGFloat = 100
    private var leftBtn = UIButton()
    var buttons = [UIButton]()
    private let colors = [#colorLiteral(red: 0, green: 0.662745098, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0, green: 0.6980392157, blue: 0.662745098, alpha: 1), #colorLiteral(red: 0.4235294118, green: 0.7607843137, blue: 0.2901960784, alpha: 1), #colorLiteral(red: 0.5921568627, green: 0.8431372549, blue: 0, alpha: 1), #colorLiteral(red: 0.8156862745, green: 0.8745098039, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.8196078431, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.4039215686, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0.8549019608, green: 0.1607843137, blue: 0.1098039216, alpha: 1)]
    var buttonState = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    let leftBtnX: CGFloat = 60
    let leftBtnY: CGFloat = 740
    
    private func setUI() {
        
        createButton(count: 6)
        leftBtn = self.btnStyle(title: "버튼 0")
        leftBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        [leftBtn].forEach {
        view.addSubview($0)
        }
        
    }
    
    private func btnStyle(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = colors.randomElement()
        button.frame.size = CGSize(width: 60, height: 60)
        button.frame.origin = CGPoint(x: leftBtnX, y: leftBtnY)
        button.layer.cornerRadius = button.bounds.size.width / 2
        return button
    }
    
    func createButton(count: Int) {
        for i in 1...count {
            let tempButton = btnStyle(title: "버튼 \(i)")
            buttons.append(tempButton)
        }
        
        buttons.forEach { view.addSubview($0) }
//        for button in buttons { view.addSubview(button) }
    }
    
    @objc private func buttonAction() {
        
        
        if buttonState == false {
            for (index, button) in buttons.enumerated() {
                UIView.animate(withDuration: 0.3) {
                    button.center.y -= (self.itemHeight * CGFloat(index))
                }
            }
            buttonState = true
        } else {
            for (index, button) in buttons.enumerated() {
                UIView.animate(withDuration: 0.3) {
                    button.center.y += (self.itemHeight * CGFloat(index))
                }
            }
            buttonState = false
        }
        
//        UIView.animate(withDuration: 0.3) {
//            self.leftBtnSub1.center.y -= 100
//        }
//        UIView.animate(withDuration: 0.3) {
//            self.leftBtnSub2.center.y -= 200
//        }
//        UIView.animate(withDuration: 0.3) {
//            self.leftBtnSub3.center.y -= 300
//        }
//        UIView.animate(withDuration: 0.3) {
//            self.leftBtnSub4.center.y -= 400
//        }

    }

}

