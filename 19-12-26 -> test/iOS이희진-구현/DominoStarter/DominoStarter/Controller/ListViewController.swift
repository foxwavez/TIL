//
//  ListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    
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
        self.tableView.rowHeight = 120
        self.tableView.sectionHeaderHeight = 80
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
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
 
        return menuData[section].products.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return String(sectionData[section].name)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        if let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") {
            cell = categoryCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "categoryCell")
        }

//        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
//        let data = menuInfo?.products[indexPath.row]
        let data = menuData[indexPath.section].products[indexPath.row]
        
        cell.textLabel?.text = data.name
        cell.imageView?.image = UIImage(named: data.image)
        cell.detailTextLabel?.text = "\(data.price)원"
        cell.selectionStyle = .none
//        cell.textLabel?.text = data?.name ?? ""
//        cell.imageView?.image = UIImage(named: data?.image ?? "")
//        cell.detailTextLabel?.text = "\(data?.price ?? 0)원"
        
        return cell
        
    }
}
// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionDataName = sectionData[section].name
        let myCustomView = UIImageView()
        let myImage = UIImage(named: sectionDataName)
        myCustomView.image = myImage

        return myCustomView

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let data = menuData[indexPath.section].products[indexPath.row]
        detailVC.title = data.name
        detailVC.detailMenuTitle = data.name
        detailVC.imageView.image = UIImage(named: data.image)
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

