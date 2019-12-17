//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    let tableView = UITableView()
    
    let maxCount = 20
    var resultArr = [Int]()
    
//    var data = Array(1...20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumder()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(reloadData))
    }
    
    func randomNumder() {
        resultArr.removeAll()
        
        let tempArr = Array(1...(maxCount + 50))
        
        for _ in 0... {
            
            guard let tempCount = tempArr.randomElement() else { return }
            
            if !resultArr.contains(tempCount) {
                resultArr.append(tempCount)
            }
            
            if resultArr.count == maxCount {
                break
            }
        }
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func reloadData() {
        randomNumder()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(resultArr[indexPath.row])"
        return cell
    }
}
