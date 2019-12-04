//
//  ViewController.swift
//  19-12-03_Task_segue
//
//  Created by Hailey Lee on 2019/12/03.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dogBtn: UIButton!
    @IBOutlet weak var catBtn: UIButton!
    @IBOutlet weak var birdBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    var dogCount = 0
    var catCount = 0
    var birdCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "(\(dogCount),\(catCount),\(birdCount))"
        dogBtn.addTarget(self, action: #selector(dogBtnToched), for: .touchUpInside)
        catBtn.addTarget(self, action: #selector(catBtnTouched), for: .touchUpInside)
        birdBtn.addTarget(self, action: #selector(birdBtnTouched), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc private func dogBtnToched() {
        dogCount = dogCount + 1
        label.text = "(\(dogCount),\(catCount),\(birdCount))"
        
    }
    @objc private func catBtnTouched() {
        catCount = catCount + 1
        label.text = "(\(dogCount),\(catCount),\(birdCount))"
    }
    @objc private func birdBtnTouched() {
        birdCount = birdCount + 1
        label.text = "(\(dogCount),\(catCount),\(birdCount))"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let secondVC = segue.destination as? SecondViewController else { return }
        
        
        switch segue.identifier {
        case "dog":
            secondVC.image = UIImage(named: "dog")!
        case "cat":
            secondVC.image = UIImage(named: "cat")!
        default:
            secondVC.image = UIImage(named: "bird")!
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
//        let dog = identifier == "dog" ? 1 : 0
//        return dogCount + dog < 8
//        let cat = identifier == "cat" ? 1 : 0
//        return catCount + cat < 10
//        let bird = identifier == "bird" ? 1 : 0
//        return birdCount + bird < 15
        
//        if let dog = identifier == "dog" ? 1 : 0 {
//            return dogCount + dog < 8
//        }
//        else if let cat = identifier == "cat" ? 1 : 0 {
//            return catCount + cat < 10
//        }
//        else if let bird = identifier == "bird" ? 1 : 0 {
//            return birdCount + bird < 15
//        } else {
//            return true
//        }
        
        switch identifier {
        case "dog":
            let dog = identifier == "dog" ? 1 : 0
            return dogCount + dog < 8
        case "cat":
            let cat = identifier == "cat" ? 1 : 0
            return catCount + cat < 10
        case "bird":
            let bird = identifier == "bird" ? 1 : 0
            return birdCount + bird < 15
        default:
           return true
        }
        
    }
    
    @IBAction func unwindToSecondController(_ unwindSegue: UIStoryboardSegue) {
        
        guard let secondVC = unwindSegue.source as? SecondViewController else { return }

        self.dogCount += secondVC.dogCount
        //
        
    }

}


