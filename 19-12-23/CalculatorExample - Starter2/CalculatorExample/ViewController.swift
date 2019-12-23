//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnDevide: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
    
    
    private func setupUI() {
        var btnArr: [UIButton] = [btnZero, btnOne, btnTwo, btnThree, btnFour,btnFive, btnSix, btnSeven, btnEight, btnNine, btnPlus, btnMinus, btnMultiply, btnDevide, btnDevide, btnEqual, btnReset]
        for btn in btnArr {
//            btnOne.frame
            btn.layer.cornerRadius = 45.5
        }
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.4
            sender.alpha = 1
            
        }
    }
    
    
    
}

