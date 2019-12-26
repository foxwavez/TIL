//
//  MainListController.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class MainListController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    
    }
    var menuInfo: DominoMenu? // ?를 해야하는 이유: DominoMeu 안에서 init을 해주지 않고 그 안에 프로퍼티를 접근해야 하기때문에 값이 없을 수도 있는 가능성이 있어 ?를 붙여야 한다
    //cell이기 때문에 빈 배열로 data를 선언하는 것이 좋다
    
    let tableView = UITableView()
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = menuInfo?.category ?? "" // menuInfo 타입이 옵셔널 타입이라 옵셔널 바인딩을 해줘야 한다
        self.tableView.dataSource = self
        self.tableView.rowHeight = 120
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
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
        return menuInfo?.menus.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        let cell: UITableViewCell
        if let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") {
            cell = menuCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MenuCell")
        }
        
        
        
        let menu = menuInfo?.menus[indexPath.row]
        cell.imageView?.image = UIImage(named: menu?.thumbnail ?? "")
        cell.textLabel?.text = menu?.name ?? "" // 타이틀 크기의 레이블
        cell.detailTextLabel?.text = "\(menu?.price ?? 0)원" // 서브타이틀 크기의 레이블
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailMenuController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
