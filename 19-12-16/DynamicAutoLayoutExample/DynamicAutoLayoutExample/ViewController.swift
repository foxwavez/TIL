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
    @IBOutlet weak var centerXconstraint: NSLayoutConstraint!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        centerXconstraint.constant = -100
//        print(myView.constraints)
//        print(view.constraints)
//
        // 1. constant, multiple 변경
        //centerXconstant.constant = 100
        
        // 2. 우선 순위 변경 (999) - 제약을 2개 만들어 놓고 서로의 우선순위를 바꿔가면서 위치를 변경할 수 있다,
    // centerXconstant.priorty = .defaulthigh // 750
        
        // 3.isActive 제약조건을 어떤 순간에 활성화 할 것이냐
        centerXconstraint.constant = 100
        centerXconstraint.isActive = false
        
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }

}

