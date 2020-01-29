//
//  CategoryTableViewCell.swift
//  DominosUpgradde
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryTableViewCell"
    
    private let categoryImageView = UIImageView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(category: String) {
        categoryImageView.image = UIImage(named: category)
    }
    
    private func setUI() {
        categoryImageView.contentMode = .scaleToFill
        contentView.addSubview(categoryImageView)
        
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
