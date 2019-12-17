//
//  TableViewCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
  
  // 코드로 생성 시
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    print("\n---------- [ init(style:reuserIdentifier) ] ----------")
  } // cell을 최초 사용할 때 생성되는 지점
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    print("\n---------- [ prepareForReuse ] ----------")
  } // cell을 재사용하는 지점
  
  deinit {
    print("Deinit")
  }
}
