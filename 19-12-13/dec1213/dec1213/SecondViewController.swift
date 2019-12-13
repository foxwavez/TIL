//
//  SecondViewController.swift
//  dec1213
//
//  Created by macbook on 2019/12/13.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var signoutButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
        signoutButton.backgroundColor = .black
        signoutButton.setTitle("Signout", for: .normal)
        signoutButton.frame = CGRect(x: view.center.x, y: view.center.y, width: 80, height: 80)
        view.addSubview(signoutButton)
        
    }
 

    

}
