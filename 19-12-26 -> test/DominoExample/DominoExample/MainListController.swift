//
//  MainListController.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class MainListController: UIViewController {

    var menuTitle = "" // 직접
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    private var datas = [String]() //cell이기 때문에 빈 배열로 data를 선언하는 것이 좋다
    
    let tableView = UITableView()
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = menuTitle // 여기서 직접 넣지 말고 변수를 선언해주는 것이 유지보수 할 때 수월하다
        self.view.addSubview(tableView)
        self.setupConstraint()
        
    }
    
    var constraint: NSLayoutConstraint!
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
    
}

// MARK: - UITableViewDataSource

extension MainListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.imageView?.image = UIImage(named: "")
        cell.textLabel?.text = "" // 타이틀 크기의 레이블
        cell.detailTextLabel?.text = "" // 서브타이틀 크기의 레이블
        return cell
    }
}

