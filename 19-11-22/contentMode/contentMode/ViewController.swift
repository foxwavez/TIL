//
//  ViewController.swift
//  contentMode
//
//  Created by Hailey Lee on 2019/11/22.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageFire: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func touchedSegment(_ sender: UISegmentedControl) {
        segmentedControl.addTarget(self, action: "action:", forControlEvents: .ValueChanged)
    }
    
}

