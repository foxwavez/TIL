//
//  SecondViewController.swift
//  StoryboardSegue
//
//  Created by Hailey Lee on 2019/12/03.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    var text = ""
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        textField.keyboardType = .phonePad
    }
    var minus = 0
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        if let number = Int(sender.text ?? "0") {
            minus = number
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let firstVC = segue.destination as? FirstViewController else { return }
    }
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

    // ActionSegue : shouldPerform -> Prepare
    // Manualsegue : PerformSegue -> Prepare

}
