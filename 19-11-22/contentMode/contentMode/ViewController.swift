//
//  ViewController.swift
//  contentMode
//
//  Created by Hailey Lee on 2019/11/22.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var first = "first"
    var second = "second"
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var segmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segment.addTarget(self, action: #selector(segmentTouched(_:)
            ), for: .valueChanged)
        segmentLabel.text = "first"
    }
    
    @objc func segmentTouched(_ sender: UISegmentedControl) {
        segmentLabel.text = second
    }
    
}

