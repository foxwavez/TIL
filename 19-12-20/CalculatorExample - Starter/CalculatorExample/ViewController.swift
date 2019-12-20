//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var numberOnScreen: Double = 0 //
    var previousNumber: Double = 0  //
    var operation = 0
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    resultLabel.text = ""
  }
    
    @IBAction func numberAction(_ sender: UIButton) {
        let tag = sender.tag
        resultLabel.text = (resultLabel.text ?? "") + String(tag - 1)
    }
    
    
    
     
}

