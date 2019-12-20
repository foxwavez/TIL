//
//  CustomCell.swift
//  TableViewCountBtn-Practicce
//
//  Created by Hailey Lee on 2019/12/19.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class {
    func didTap(cell: CustomCell)
}

class CustomCell: UITableViewCell {
    
    weak var delegate: CustomCellDelegate?
    
    let btn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    func setUpUI() {
        contentView.addSubview(btn)
        
        btn.backgroundColor = .yellow
        btn.setTitle("Count Up", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnTouched), for: .touchUpInside)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        btn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 300).isActive = true
        btn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        btn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func btnTouched() {
        delegate?.didTap(cell: self)
    }
    
//    private var indexPath: IndexPath!
//    func currentIndexPath(_ indexPath: IndexPath) {
//        self.indexPath = indexPath
//    }
}


