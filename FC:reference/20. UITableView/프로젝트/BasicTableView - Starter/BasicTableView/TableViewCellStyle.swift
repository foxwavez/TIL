//
//  TableViewCellStyle.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCellStyle: UIViewController {
  
  override var description: String { "TableView - CellStyle" }
  
  /***************************************************
   셀 스타일 4가지 (default, subtitle, value1, value2)
   ***************************************************/
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.rowHeight = 70
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    
    // automaticDimension는 셀 안에 들어가는 뷰의 크기에 따라서 자동으로 크기 조절
//    tableView.rowHeight = UITableView.automaticDimension
    
    // estimatedRowHeight는 테이블뷰 셀의 대략적인 크기를 최초에 셀이 나타날 때 정해주고 셀안에 콘텐츠가 로그괴면 정해지는 크기가 rowheight
    tableView.rowHeight = 100
    tableView.estimatedRowHeight = 40
    }
}

// MARK: - UITableViewDataSource

extension TableViewCellStyle: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // 재사용
    let cell: UITableViewCell
    
    if indexPath.row % 4 == 0 {
      // 셀 재사용 시도 후 없으면 생성
      cell = tableView.dequeueReusableCell(withIdentifier: "Default")
        ?? UITableViewCell(style: .default, reuseIdentifier: "Default")
    } else if indexPath.row % 4 == 1 {
      cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
    } else if indexPath.row % 4 == 2 {
      cell = tableView.dequeueReusableCell(withIdentifier: "Value1")
        ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: "Value2")
        ?? UITableViewCell(style: .value2, reuseIdentifier: "Value2")
    }
    
    // 공통 속성 세팅
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.detailTextLabel?.text = "ABCD"
    cell.imageView?.image = UIImage(named: "bear")
    cell.accessoryType = .checkmark
    return cell
  }
}

// MARK: - UITableViewDelegate

extension TableViewCellStyle: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 4 == 0 {
            return 120
        } else {
            return 50
        }
    }
}
