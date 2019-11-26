//
//  ViewController.swift
//  ArletControllerExample
//
//  Created by Hailey Lee on 2019/11/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "0"
        
    }

    @IBAction func didTapButton(_ sender: Any) {
        let alretController = UIAlertController(
            title: "카운트 추가?",
            message: "",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Add Count", style: .default){
            _ in
            self.count = self.count + 1
            self.countLabel.text = "\(self.count)"
        }
        alretController.addAction(okAction)
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel) { _ in
            print("cancel")
        }
        alretController.addAction(cancleAction)
        
        let deleteAction = UIAlertAction(title: "Reset", style: .destructive){ _ in
            self.count = 0
            self.countLabel.text = "\(self.count)"
        }
        alretController.addAction(deleteAction)
        
        present(alretController, animated: true)
    }
    
}

