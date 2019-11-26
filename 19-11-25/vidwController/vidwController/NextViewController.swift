//
//  NextViewController.swift
//  vidwController
//
//  Created by macbook on 2019/11/25.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class NextViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print("NextVC viewDidload")
        setupButton()
        
        isModalInPresentation = true
    }
    
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func didTapButton(_ button: UIButton) {
        presentedViewController  // nil
        presentingViewController // viewController
        print(presentingViewController?.presentedViewController)
        //self // nextVC
        //self.presentingViewController // ViewController
        //self.presentingViewCOntroller.presentedViewController //NextVC
        
        presentingViewController?.view.backgroundColor = .orange
        
        
        guard let vc = presentingViewController as? ViewController else { return }
        vc.button.setTitle("클릭", for: .normal)
        
        
        
        dismiss(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NextVC viewWillApppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("NextVC viewDidAppear")
        isModalInPresentation = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NextVC viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("NextVC viewDidDisappear")
    }
    
    
    
    

}
