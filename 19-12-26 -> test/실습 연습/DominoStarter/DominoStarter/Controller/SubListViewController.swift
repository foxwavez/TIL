//
//  SubListViewController.swift
//  DominoStarter
//
//  Created by Hailey Lee on 2020/01/30.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class SubListViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Sub"
        [tableView].forEach {
            view.addSubview($0)
        }
        
        tableView.rowHeight = CGFloat(100)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SubCell")
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


extension SubListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCell", for: indexPath)
        let data = menuData[indexPath.row]
        cell.imageView?.image = UIImage(named: data.category)
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SubListViewController: UITableViewDelegate {
    
}

