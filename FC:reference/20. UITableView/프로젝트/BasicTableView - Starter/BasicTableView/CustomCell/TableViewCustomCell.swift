//
//  TableViewCustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCustomCell: UIViewController {
  
  /***************************************************
   커스텀 셀 사용하기
   ***************************************************/
  
  override var description: String { "TableView - CustomCell" }
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 80
    view.addSubview(tableView)
    
    // UITableViewCell (홀수형), CustomCell (짝수형)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
  }
}

// MARK: - UITableViewDataSource

extension TableViewCustomCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
 
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell
    
    if indexPath.row.isMultiple(of: 2) {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! CustomCell
        customCell.myLabel.text = "ABCD"
        cell = customCell
        // 이런식으로 타입캐스팅인 if문 빠져나가서 다시 타입캐스팅 한다. 초기에 선언한 cell의 타입이 바뀌지 않음
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: inde) as! CustomCell 이렇게 해주면 위 방식으로 사용 가능, if 문 안에서 상수를 새로 선언 한 것
    } else {
        cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
    }
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.imageView?.image = UIImage(named:  "bear")
    return cell
  }
    
}


// MARK: - UITableViewDelegate

extension TableViewCustomCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let customCell = cell as? CustomCell else { return }
        customCell.myLabel.frame = CGRect(x: cell.frame.width - 120, y: 15, width: 100, height: cell.frame.height - 30)
        // 셀마다 프레임을 서로 다르게 설정해주는 경우
        print("WillDisplayCell")
    }
}

