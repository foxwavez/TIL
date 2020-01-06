//
//  ListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
//    var menuInfo: Menu?
//    var productInfo: Product?
    
    let tableView = UITableView()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(menuData)
        setupUI()
    }
    
    
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Domino's"
        self.tableView.rowHeight = 100
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
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
}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { menuData.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return productInfo?.name.count ?? 0
        // menuInfo?.products.count ?? 0
        
        return menuData[section].products.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let cell: UITableViewCell
        if let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") {
            cell = categoryCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "categoryCell")
        }
        
//        let data = menuInfo?.products[indexPath.row]
        
        cell.textLabel?.text = menuData[indexPath.section].products[indexPath.row].name
        cell.imageView?.image = UIImage(named: menuData[indexPath.section].products[indexPath.row].image)
        cell.detailTextLabel?.text = "\(menuData[indexPath.section].products[indexPath.row].price)원"
//        cell.textLabel?.text = data?.name ?? ""
//        cell.imageView?.image = UIImage(named: data?.image ?? "")
//        cell.detailTextLabel?.text = "\(data?.price ?? 0)원"
        
        //        cell.textLabel?.text = "나오나 안나오나 확인 해보자"
        //        cell.imageView?.image = UIImage(named: "핫소스")
        //        cell.detailTextLabel?.text = "\(10000000)원"
        
        return cell
        
    }
}
// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

