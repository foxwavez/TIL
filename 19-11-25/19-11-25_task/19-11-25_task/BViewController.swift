//
//  BViewController.swift
//  19-11-25_task
//
//  Created by Hailey Lee on 2019/11/25.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    let label = UILabel()
    let button = UIButton(type: .system)
    
    func setupUI() {
        if #available(iOS 13.0, *) {
          view.backgroundColor = .systemBackground
        } else {
          view.backgroundColor = .white
        }
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
        label.text = "\(count)"
        self.view.addSubview(label)
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(nextViewButton(_sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    
    @objc private func nextViewButton( _sender: UIButton){
        presentingViewController?.view.backgroundColor = .orange
        
        guard let vc = presentingViewController as? ViewController else { return }
        vc.button.setTitle("button", for: .normal)
        
//        dismiss(animated: true, completion: (<#T##(() -> Void)?##(() -> Void)?##() -> Void#>),
        count = count + 1
        label.text = "\(count)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
