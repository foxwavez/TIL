//
//  ListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
    let tableView = UITableView()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
  }
    private func setUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Domio's"
        [tableView].forEach {
            view.addSubview($0)
        }

        setupConstraint()
    }
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor,constant: 0),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0)
        ])
    }
}
