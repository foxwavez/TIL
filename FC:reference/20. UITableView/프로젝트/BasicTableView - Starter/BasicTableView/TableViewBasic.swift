//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame, style: .plain)
    tableView.dataSource = self // 데이터소스를 구현하고 있는 객체를 알려줘야 한다
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    //UITableViewCell.self의 의미는 각 셀의 타입이 UITableViewCell 타입을 사용할 것이라는 의미
    
//    tableView.register(MyTableViewCell, forCellReuseIdentifier: "CellID")
  }
}

extension TableViewBasic: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1) 매번 새로운 Cell 생성
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        // 2) 재사용 - 미등록
//        let cell: UITableViewCell
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
//            cell = reusableCell
//            print("재사용")
//        }else{
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//            print("새로 생성")
//        }
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        // 3) 재사용 - 선등록(viewDidload에서 register) //withIdentifier가 틀리면 앱이 죽는다
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}



