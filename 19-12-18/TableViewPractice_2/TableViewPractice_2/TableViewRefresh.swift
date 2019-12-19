//
//  ViewController.swift
//  TableViewPractice_2
//
//  Created by Hailey Lee on 2019/12/18.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class TableViewRefresh: UIViewController {
    
    let tableView = UITableView()
    let maxCount = 20
    var resultArr = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(reloadData))
    }
    
    func randomNumber() {
        resultArr.removeAll()
        let tempArr = Array(1...(maxCount + 50))
        
        while resultArr.count < 20 {
            guard let tempCount = tempArr.randomElement() else { return }
            
            if !resultArr.contains(tempCount) {
                resultArr.append(tempCount)
            }
        }
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func reloadData() {
        randomNumber()
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    

}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "\(resultArr[indexPath.row])"
        return cell
    }
}


