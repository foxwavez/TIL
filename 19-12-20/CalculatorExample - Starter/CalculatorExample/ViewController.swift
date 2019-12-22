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
    var previousNumber: Double = 0 //
    var operation = 0
    var isPerformOperation = false
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    resultLabel.text = ""
    
  }
    
    @IBAction func numberAction(_ sender: UIButton) {
        let tag = sender.tag
                if isPerformOperation == true {
                    isPerformOperation = false
                    let result = tag - 1
                    
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.minimumFractionDigits = 0
                    formatter.maximumFractionDigits = 3
                    let numString = formatter.string(from: result as NSNumber)
                    resultLabel.text = numString
                    numberOnScreen = Double(result)
                } else {
                    
                    resultLabel.text = resultLabel.text! + String(tag - 1)
                    numberOnScreen = Double(resultLabel.text!)!
                }
        //        resultLabel.text = resultLabel.text! + String(tag - 1)


    }
    
    @IBAction func operatorAction(_ sender: UIButton) {
        
        let tag = sender.tag
        //  AC 버튼
        if tag == 11 {
            resultLabel.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        // +(16) -(15) *(14) /(13) =(12)기능
        switch tag {
        case 16, 15, 14, 13:
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 3
            let numString = formatter.string(from: numberOnScreen as NSNumber)
            print(numString!)
            
            previousNumber = Double(resultLabel.text ?? "")!
            operation = tag
            isPerformOperation = true
            resultLabel.text = String(numString!)
        case 12:
            switch operation {
            case 16:
                let plusResult = previousNumber + numberOnScreen
                
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 3
                let numString = formatter.string(from: plusResult as NSNumber)
                print(numString!)
                
                resultLabel.text = numString!
            case 15:
                resultLabel.text = String(previousNumber - numberOnScreen)
            case 14:
                resultLabel.text = String(previousNumber * numberOnScreen)
            case 13:
                resultLabel.text = String(previousNumber / numberOnScreen)
            default:
                resultLabel.text = ""
            }
        default:
            resultLabel.text = ""
        }
        
    }
    }


