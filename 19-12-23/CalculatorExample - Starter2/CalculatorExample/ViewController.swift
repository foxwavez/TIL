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
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
    
    
    private func setupUI() {
        for btn in buttons{
            btn.layer.cornerRadius = oneBtn.frame.height / 2 + 4
        }
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.4
            sender.alpha = 1
        }
    }
    func formatter(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        guard let numString = formatter.string(from: number as NSNumber) else { return "" }
        return numString
    }
    
    private var displayText = ""
    var displayValue: Double = 0
    var beforeValue: Double = 0
    var operatorValue: Double = 0
    var isPerformOperation = false
    var isPerformPlus = false
    var isPerformMinus = false
    
    @IBAction func numberBtnAction(_ sender: UIButton) {
        
        guard let identifier = sender.accessibilityIdentifier else { return }
        if isPerformOperation == true {
            isPerformOperation = false
            displayText = identifier
            guard let number = Double(displayText) else { return }
            displayLabel.text = formatter(number: number)
            displayValue = number
            print("character \(number)")
        }else{
            displayText = displayText + identifier
            displayValue = Double(displayText)!
            guard let number = Double(displayText) else { return }
            displayLabel.text = formatter(number: number)
            print("String \(displayText)")
        }
    }
    
    @IBAction func operatorBtnAction(_ sender: UIButton) {
        guard let identifier = sender.accessibilityIdentifier else { return }
        isPerformOperation = true
        switch identifier {
        case "plus":
            print("plus - \(Double(displayText)!), \(displayValue)")
            beforeValue = displayValue
            isPerformPlus = true
        case "minus":
            print("plus - \(Double(displayText)!), \(displayValue)")
            beforeValue = displayValue
            isPerformMinus = true
        default:
            break
        }
        
//        switch identifier {
//        case "equal":
//            let plusValue = Double(displayText)! + beforeValue
//            print("equal")
//            operatorValue = plusValue
//            displayLabel.text = formatter(number: plusValue)
//        default:
//            break
//        }
        
    }
    
    @IBAction func equalBtnAction(_ sender: UIButton) {
        guard let identifier = sender.accessibilityIdentifier else { return }
        if identifier == "equal" {
            if isPerformPlus == true {
                let plusValue = beforeValue + Double(displayText)!
                print("equal - \(beforeValue), \(Double(displayText)!)")
                operatorValue = plusValue
                displayLabel.text = formatter(number: plusValue)
                isPerformPlus = false
            } else if isPerformPlus == false {
                operatorValue = operatorValue + Double(displayText)!
                displayLabel.text = formatter(number: operatorValue)
                isPerformPlus = false
            }
//            if isPerformMinus == true {
//                let minusValue = beforeValue - Double(displayText)!
//                print("equal - \(beforeValue), \(Double(displayText)!)")
//                operatorValue = minusValue
//                displayLabel.text = formatter(number: minusValue)
//                isPerformMinus = false
//            } else if isPerformMinus == false {
//                operatorValue = operatorValue - Double(displayText)!
//                displayLabel.text = formatter(number: operatorValue)
//                isPerformMinus = false
//            }
        }
    }
    
    
    @IBAction func resetBtnAction(_ sender: UIButton) {
        guard let identifier = sender.accessibilityIdentifier else { return }
        if identifier == "reset"{
            displayValue = 0
            operatorValue = 0
            beforeValue = 0
            displayText = "0"
            displayLabel.text = "0"
        }
        else {
            
        }
    }
    
}

