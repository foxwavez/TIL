//
//  ViewController.swift
//  19-11-20school
//
//  Created by Hailey Lee on 2019/11/21.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tealView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func myButton(_ sender: UIButton) {
        print("버튼이 눌렸습니다")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blueView = UIView()
        blueView.backgroundColor = .systemBlue
        blueView.frame  = CGRect(x: 0, y: 0, width: 100, height: 100)
        blueView.center = view.center
        self.view.addSubview(blueView)
        
    }
}

