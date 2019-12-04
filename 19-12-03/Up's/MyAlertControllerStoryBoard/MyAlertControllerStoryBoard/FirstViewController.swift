//
//  FirstViewController.swift
//  MyAlertControllerStoryBoard
//
//  Created by Lee on 2019/12/03.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  @IBOutlet weak var displayLabel: UILabel!
  
  @IBAction func unwindToCancel(_ unwindSegue: UIStoryboardSegue) {
    
  }
  
  @IBAction func unwindToEnter(_ unwindSegue: UIStoryboardSegue) {
    guard let vc = unwindSegue.source as? SecondViewController else { return }
    
    displayLabel.text = vc.contentTextField.text
  }
}

