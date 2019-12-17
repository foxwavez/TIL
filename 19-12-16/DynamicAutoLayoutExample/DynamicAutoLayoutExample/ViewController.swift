//
//  ViewController.swift
//  DynamicAutoLayoutExample
//
//  Created by Hailey Lee on 2019/12/16.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var centerXconstraint: NSLayoutConstraint! // 높은 우선순위
    @IBOutlet weak var centerYconstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerXconstraint.constant = -100
        
//        self.view.setNeedsLayout() //레이아웃이 필요해라고 값을 true로 값이 변경
//        layoutIfNeeded() -> 레이아웃 필요 true -> 레이아웃을 당장 실행해 setNeedsLayout이 false인 경우 실행안됨
//
//        frame 의 경우 이런것이 필요하지 않음.
//
//        애니메이션 효과
//        UIView.animate(withDuration: 1){
//        self.centerYConstraint.constant = 100 // self.view.setNeedsLayout()을 호출하는 효과가 있다.
//
//        self.view.layoutIfNeeded() // 현재 레이아웃 Needs가 true면 현재 레이아웃을 실행
//                }
//        print(myView.constraints)
//        print(view.constraints)
    }
    
//    1. constant, multiplier 변경
//    centerXconstant.constant = 100
//
//    2. 우선순위 변경 (999) - 제약을 2개 만들어 놓고 서로의 우선순위를 바꿔가면서 위치를 변경할 수 있다.
//    centerXConstant.priority = .defaultHigh // 750
//     제약1 = 999   제약2 = 750 인 경우, 제약2가 적용됨. 서로의 우선순위를 바꾸면 우선순위가 높은쪽이
//     적용된다.
//
//    3. 제약의 isActive값(true or false)을 바꾼다. false인 경우 제약조건이 없어지는 것과 같다. 참조카운트가 -1 됨.스토리보드 사용하여 weak로 연결한 경우 false로 바꾸면 메모리에서 해제된다.
//     코드로 하는 경우 weak로 연결한 것이 아니라서 isActive를 false로 바꿨다가 다시 true로 변경하면 제약을 다시 사용할 수 있다.
    var toggle = true
    
    @IBAction func move(_ sender: Any) {
        if toggle {
            UIView.animate(withDuration: 1) {
                self.centerYconstraint.constant = 100
                self.view.layoutIfNeeded()
                // 오토레이아웃 constant으로 애니메이션 할 때는 꼭 layoutIfNeeded()을 추가해야 한다
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.centerYconstraint.constant = -100
                self.view.layoutIfNeeded()
            }
        }
        toggle.toggle()
        // toggle()이란 함수가 bool타입 true, false 전환하는 기능이다.
    }
}

