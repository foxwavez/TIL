//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  x ~ y까지의 숫자 (x, y는 임의의 숫자) (10 ~ 50, 60 ~ 78, 0 ~ 100)
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ***************************************************/
    
    override var description: String { "Practice 2 - Section" }
    lazy var sectionTitle: [Int] = dataDic.keys.sorted()
    //  let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    let dataArr = Array(1...100)
    
    var dataDic = [Int: [Int]]()
    func rebuild() {
        for element in dataArr {
            let section = element / 10
            if var valueArray = dataDic[section] {
                valueArray.append(element)  // [0, 1]
                dataDic[section] = valueArray   // 0: [0  ~ 9]
            } else {
                dataDic[section] = [element]
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        rebuild()
    }
}
// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataDic.keys.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionTitle[section])
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titles = dataDic.keys.sorted()
        let key = titles[section]
        return dataDic[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let data = dataDic[sectionTitle[indexPath.section]]!
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
