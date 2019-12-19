//
//  CustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let myLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // 커스텀 뷰를 올릴 때는 contentView 위에 추가
    contentView.addSubview(myLabel)
    myLabel.textColor = .black
    myLabel.backgroundColor = .yellow
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
    // 오토레이아웃 설정 관련
//    override func updateConstraints() {
//        super.updateConstraints()
//    }
  
  // 레이아웃 조정 시 // 프레임 설정 시 호출되는 메소드
  override func layoutSubviews() {
    super.layoutSubviews()
    
    //여기서 부터 문제 였다 
    myLabel.frame = CGRect(x: contentView.frame.width - 120, y: 15, width: 100, height: contentView.frame.height - 30)
    // 프레임 조정은 init메소드에서는 안되고 여기서 해야한다.
  }
}
