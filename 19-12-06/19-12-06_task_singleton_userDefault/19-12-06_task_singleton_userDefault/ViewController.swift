//
//  ViewController.swift
//  19-12-06_task_singleton_userDefault
//
//  Created by Hailey Lee on 2019/12/06.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    
    var img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let str = UserDefaults.standard.string(forKey: "image") {
            img = UIImage(named: str)!
        }
        toggle.addTarget(self, action: #selector(toggleTouched), for: .valueChanged)
        
        imgView.image = img
        label.text = "dog"
        
        
        UserDefaults.standard.set(label, forKey: "dog")
        
    }
    @objc private func toggleTouched(_ sender: UISwitch) {
        if toggle.isOn {
            img = UIImage(named: "dog")!
            imgView.image = img
            label.text = "dog"
            imgView.image = UserDefaults.standard.object(forKey: "dog") as? UIImage
            
        }
        else {
            img = UIImage(named: "cat")!
            imgView.image = img
            label.text = "cat"
        }
    }
    // swithch에서 .setOn을 사용하면 애니메이션까지 해줄 수 있다
    // .setOn(on: Bool, animated: Bool)이 이렇게 나오게 된다
}

