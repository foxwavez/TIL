//
//  CategoryTableViewController.swift
//  Dominos
//
//  Created by Lee on 2020/01/29.
//  Copyright © 2020 Up's. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
    // self.clearsSelectionOnViewWillAppear = false
  }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    menuData.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
    
    cell.configure(category: menuData[indexPath.row].category)
    
    return cell
  }
}
