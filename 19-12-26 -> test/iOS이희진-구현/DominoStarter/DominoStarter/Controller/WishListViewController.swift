//
//  WishListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    

    var count = 0
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print(wishPizza.wishListDict)
    }
    
    private func setupUI() {
        navigationItem.title = "Wish List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(leftIemAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(rightIemAction))
        self.view.backgroundColor = .white
        self.tableView.rowHeight = 100
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "wishCell")
        self.view.addSubview(tableView)
        
        setupConstraint()
    }
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
               
               tableView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   tableView.topAnchor.constraint(equalTo: guide.topAnchor),
                   tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                   tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
                   tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
               ])
    }
    
    @objc private func leftIemAction() {
        
    }
    @objc private func rightIemAction() {
        
    }
}


// MARK: - UITableViewDataSource

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return menuInfo?.products.count ?? 0
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath)
//        let data = menuInfo?.products[indexPath.row]
//        cell.textLabel?.text = wishPizza.wishListDict
//        cell.imageView?.image = UIImage(na   med: data?.image ?? "")
        return cell
        
    }
}
// MARK: - UITableViewDelegate

extension WishListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

