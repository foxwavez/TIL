//
//  ViewController.swift
//  AlertController
//
//  Created by Lee on 2019/12/03.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var displayLabel: UILabel!
  
  @IBAction func alertAction(_ sender: UIButton) {
    let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
    alertController.addTextField()
    
    let enterAction = UIAlertAction(title: "Enter", style: .default) { _ in
      self.displayLabel.text = alertController.textFields?[0].text
    }
    alertController.addAction(enterAction)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true)
  }
}
