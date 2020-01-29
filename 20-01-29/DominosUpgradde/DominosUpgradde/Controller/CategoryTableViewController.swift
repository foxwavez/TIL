//
//  CategoryTableViewController.swift
//  DominosUpgradde
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 200))
        imageView.contentMode = .scaleAspectFit
        tableView.tableHeaderView = imageView
        
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
        
        cell.configure(category: menuData[indexPath.row].category)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = menuData[indexPath.row]
        
        let productTableVC = ProductTableViewController(menu: menu)
        
        navigationController?.pushViewController(productTableVC, animated: true)
    }

}
