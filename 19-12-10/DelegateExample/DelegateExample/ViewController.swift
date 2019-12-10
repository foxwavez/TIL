//
//  ViewController.swift
//  DelegateExample
//
//  Created by Hailey Lee on 2019/12/10.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myView.backgroundColor  = .blue
        myView.backgroundColor = .systemPink
        myView.backgroundColor = .red
        myView.backgroundColor = nil
        // 새로 변경될 색은 red -> blue, nil -> black
        
        // 2. delegate = self
        myView.delegate = self
        }
    }
    // 1. Delegate 프로토콜 채택
    extension ViewController: CustomViewDelegate {
        func colorForBackground(_ newColor: UIColor?)-> UIColor {
            guard  let color = newColor else { return .black }
            return color == .red ? .blue : color
        }
    }

