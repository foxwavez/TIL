//
//  DetailViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
  }

    private func setUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "Detail"
    }
    
}
