//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CreateNewWSViewController: UIViewController {
    
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.addSubview(button)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Create New Workspace", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setupConstraint()
    }
    
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: guide.centerYAnchor)
        ])
    }
    @objc private func buttonAction(_ sender: UIButton) {
        let nameVC = NameWSViewController()
        let navi = UINavigationController(rootViewController: nameVC)
        navi.modalPresentationStyle = .fullScreen // 전체 화면으로 보이게 하려면 필요 
        present(navi, animated: true, completion: nil)
        // nameVC가 네비게이션바가 있어야 하기 때문에 여기서 네비게이션 컨트롤로 화면 전환(present)을 해야 한다.
        // rootView는 view 계층에서 제일 위에 있는(보여지는) view
//        present(nameVC, animated: true)
    }
}
