//
//  CustomView.swift
//  DelegateExample
//
//  Created by Hailey Lee on 2019/12/10.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit
// 1. 프로토콜 정의
protocol CustomViewDelegate: class {
    func colorForBackground(_ newColoe: UIColor?) -> UIColor
}

class CustomView: UIView {
    weak var delegate: CustomViewDelegate?
 //weak사용 하려면 프로토콜의 타입이 class여야 한다

    override var backgroundColor: UIColor? {
        get { super.backgroundColor }
        set {
            
            let color = delegate?.colorForBackground(newValue)
            let newColor = color ?? newValue ?? .black
            super.backgroundColor = newValue
            super.backgroundColor = newColor
            print("새로 변결될 색은", self.backgroundColor!)
            }
        }
    }

