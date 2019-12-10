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
    }

}

