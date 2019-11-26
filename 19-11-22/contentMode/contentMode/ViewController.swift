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
    @IBOutlet weak var switchToggle: UISwitch!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segment.addTarget(self, action: #selector(segmentTouched(_:)
            ), for: .valueChanged)
        segmentLabel.text = "first"
        segmentLabel.font = UIFont.systemFont(ofSize: 36)
        segmentLabel.frame = CGRect(x: 32, y: 300, width: 360, height: 100)
        segment.center = CGPoint(x: view.center.x, y: view.center.y - 200)
        switchToggle.addTarget(self, action: #selector(switchToched(_:)), for: .valueChanged)
        switchToggle.frame = CGRect(x: view.center.x , y: view.center.y, width: 360, height: 200)
        switchLabel.text = "ON"
        switchLabel.frame = CGRect(x: 200, y: 500, width: 360, height: 200)
    }
    
    @objc func segmentTouched(_ sender: UISegmentedControl) {
//        if segmentLabel.text == first {
//            segmentLabel.text = second
//        } else if segmentLabel.text == second {
//            segmentLabel.text = first
//        }
        
        let index = sender.selectedSegmentIndex
        segmentLabel.text = sender.titleForSegment(at: index)
    }
    @objc func switchToched(_ sender:UISwitch) {
        if switchToggle.isOn {
            switchLabel.text = "ON"
        } else {
            switchLabel.text = "OFF"
        }
    }
}

