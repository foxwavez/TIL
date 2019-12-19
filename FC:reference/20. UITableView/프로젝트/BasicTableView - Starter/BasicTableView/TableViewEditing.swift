//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
  
  /***************************************************
   테이블뷰 목록 수정하기 (insert, delete 등)
   ***************************************************/
  
  override var description: String { "TableView - Editing" }
  
  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
    )
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
    
  @objc func switchToEditing() {

    tableView.setEditing(!tableView.isEditing, animated: true)
  }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none: print("none")
        case .delete:
            data.remove(at: data.firstIndex(of: data[indexPath.row])!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print("delete")
        case .insert:
            data.insert(Int.random(in: 1...50), at: data.firstIndex(of: data[indexPath.row])!)
            tableView.insertRows(at: [indexPath], with: .automatic)
            print("insert")
        default: print("default")
        }
    }
    
}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
    // 기본값 true
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row.isMultiple(of: 2) {
//            return true
//        } else {
//            return false
//        }
//    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // 기본값은 delete
        let row = indexPath.row
        if row % 3 == 0 {
            return .none
        } else if row % 3 == 1 {
            return .delete
        } else {
            return .insert
        }
    }
    
    // iOS 8 이상 ~ 10까지 //trailing 에서만 가능
//    tableviewedit -> 여기서부터 놓침 잘 안씀
    
    
    // iOS 11 이상
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        print("\n----------------------\n")
        
        let addAction = UIContextualAction(style: .normal, title: "Add") {
            (action, sourceView, actionPerformed) in
            print("Add Action")
            actionPerformed(true)
        }
        addAction.backgroundColor = .blue
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") {
            (action, sourceView, actionPerformed) in
            print("Delete Action")
            actionPerformed(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [addAction, deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}


