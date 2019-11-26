//
//  ViewController.swift
//  vidwController
//
//  Created by macbook on 2019/11/25.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //FullScreen modal presentation style
        
    let button = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setupUI()
    }
    
    func setupUI() {
        if #available(iOS 13, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
     
    @objc private func didTapButton(_ sender: UIButton) {
        let nextVC = NextViewController()
//        nextVC.modalPresentationStyle = .fullScreen
        nextVC.view.backgroundColor = .red
        
//        드래그 제스처와 관련된 코드
//        nextVC.isModalInPresentation = true
//        nextVC.presentationController?.delegate = self
        
        present(nextVC, animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWIllappear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisapper")
    }
    
}

extension ViewController : UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("presentationcontrollerDidmiss")
    }
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerWillDismiss")
    }
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerDidAttemptToDismiss")
    }
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        print("presentationControllerShouldDismiss")
        return false
    }
    
    
    
}

