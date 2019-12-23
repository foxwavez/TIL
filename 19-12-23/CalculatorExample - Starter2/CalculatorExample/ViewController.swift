//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var numberBtns: [UIButton]!
    @IBOutlet var operatorBtns: [UIButton]!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var multiplyBtn: UIButton!
    @IBOutlet weak var devideBtn: UIButton!
    @IBOutlet weak var equalBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    private var displayValue: String = ""
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
    
    
    private func setupUI() {
        for btn in buttons{
            btn.layer.cornerRadius = oneBtn.frame.height / 2 + 4
//            btn.layer.cornerRadius = 45.5
        }
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.4
            sender.alpha = 1
            
        }
    }
    
    @IBAction func numberBtnAction(_ sender: UIButton) {

        guard let identifier = sender.accessibilityIdentifier else { return }
        guard let number = Double(identifier) else { return }
        
        
        print(number)
        displayLabel.text = "\(number)"
    }
    
    @IBAction func operatorBtnAction(_ sender: UIButton) {
    
    
    }
    
    @IBAction func resetBtnAction(_ sender: UIButton) {
    }
    
}

