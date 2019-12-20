//
//  ViewController.swift
//  TableViewCountBtn-Practicce
//
//  Created by Hailey Lee on 2019/12/19.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data = Array(1...20)
    let tableView = UITableView()
//    let tempdata = ["희진", "유업", "지현", "참솔"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    }
    
    override func viewSafeAreaInsetsDidChange() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt \(indexPath)")
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.tag = 1
//        cell.textLabel?.text = tempdata[indexPath.row]
//        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.text = String(data[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}


extension ViewController: CustomCellDelegate {
    func didTap(cell: CustomCell) {
        tableView.indexPath(for: cell)
        guard let index = tableView.indexPath(for: cell) else { return }
        print(data[index.row])
        
        data[index.row] = data[index.row] + 1
        cell.textLabel?.text = String(data[index.row])
    }
}






