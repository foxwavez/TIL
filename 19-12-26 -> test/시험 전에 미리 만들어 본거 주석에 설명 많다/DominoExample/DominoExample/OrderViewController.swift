//
//  ViewController.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    
    // MARK: - TableView Data
    
    
    let datas: [DominoMenu] = [
        DominoMenu(category: "슈퍼 시드 함유 도우",
                   menus: [
                    Menu(name: "글램핑 바비큐", price: 35_900, thumbnail: DominoImage.hotPizza),
                    Menu(name: "알로하 하와이안", price: 31_900, thumbnail: DominoImage.whitePizza),
                    Menu(name: "우리 고구마", price: 31_900, thumbnail: DominoImage.shirimpPizza),
                    Menu(name: "콰트로 치즈 퐁듀", price: 25_900, thumbnail: DominoImage.meatPizza),
        ]), // 0번째 cell의 데이터가 menuInfo로 들어간다고 생각하면 된다
        DominoMenu(category: "프리미엄", menus: []),
        DominoMenu(category: "클래식", menus: []),
        DominoMenu(category: "사이드디스", menus: []),
        DominoMenu(category: "음료", menus: [])
    ]
    
    let imageView = UIImageView()
    let tableView = UITableView()
    
    // 1)
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Domino's"
        
        imageView.image = UIImage(named: DominoImage.logo)
        imageView.contentMode = .scaleAspectFit // 이미지가 짜부되지 않고 원래의 비율대로 나오게 하는
        self.view.addSubview(imageView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoyCell")
        // dequeueReusanbleCell로 셀을 재사용하는 것이기 때문에 UITableViewCell.self
        self.view.addSubview(tableView)
        
        setupConstraint() // setupUI 안에서 위치를 잡아주는거기 때문에 함수를 호출해줘야 한다
    }
    private func setupConstraint() {
        let guide = self.view.safeAreaLayoutGuide
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
    
}

// MARK: - UITableViewDataSource

// 작업해줄 컨트롤러
extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count // 여기 수정
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoyCell", for: indexPath)
        let data = datas[indexPath.row]
        cell.textLabel?.text = data.category
//        cell.textLabel?.text = datas[indexPath.row] // 여기 수정
        // indexPath -> 테이블 뷰에서 로우들의 인덱스
        // struct를 따로 Menu에 만들어주었기 때문에 위처럼 수정해줘야 한다
        cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: DominoImage.logo)!) // 여기 수정 / 그런데 이거는 완전한 게 아니므로 유의
        return cell
    }
}

// 셀이 터치될 때를 알려면 delegate
// MARK: - UITableViewDelegate

// UINAvigationController - rootViewController = Order VC

// Present -> MenuListVC X
// push -> NavigationVC가 관리 VC(네비게이션VC가 관리하는 뷰컨트롤러-> 네비게이션이 들어가 있는 뷰)
extension OrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 터치했을 때 실행하는 함수라서 didSelectRowAt
        let menuListVC = MainListController()
        menuListVC.menuInfo = datas[indexPath.row]
//        menuListVC.menuTitle = datas[indexPath.row]
        //
        self.navigationController?.pushViewController(menuListVC, animated: true)
        //pushViewController는 네비게이션바에서 관리하고 로우를 누르면 다른 뷰가 나오게 해주는 역할
    }
}
