//
//  ViewController.swift
//  heejinLee_PM
//
//  Created by Hailey Lee on 2019/11/29.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menu: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var jNoodle: UILabel!
    @IBOutlet weak var seaNoodle: UILabel!
    @IBOutlet weak var tang: UILabel!
    @IBOutlet weak var jNoodlePrice: UILabel!
    @IBOutlet weak var seaNoodlePrice: UILabel!
    @IBOutlet weak var tangPrice: UILabel!
    @IBOutlet weak var jNoodleVolume: UILabel!
    @IBOutlet weak var seaNoodleVolume: UILabel!
    @IBOutlet weak var tangVolume: UILabel!
    @IBOutlet weak var jNoodleOrder: UIButton!
    @IBOutlet weak var seaNoodleOrder: UIButton!
    @IBOutlet weak var tangOrder: UIButton!
    var jNoodleCount = 0
    var seaNoodleCount = 0
    var tangCount = 0
    var OrderPrice = 0

    
    let 소지금 = UILabel()
    let 결제금액 = UILabel()
    let 소지금가격 = UILabel()
    let 결제금액가격 = UILabel()
    let 초기화 = UIButton(type: .system)
    let 결제 = UIButton(type: .system)
    var 소지금_디폴트 = 70000
    override func viewDidLoad() {
        super.viewDidLoad()
        jNoodleOrder.addTarget(self, action: #selector(jNoodleOrderTouched), for: .touchUpInside)
        seaNoodleOrder.addTarget(self, action: #selector(seaNoodleOrerTouched), for: .touchUpInside)
        tangOrder.addTarget(self, action: #selector(tangOrderTouched), for: .touchUpInside)
        소지금.frame = CGRect(x: 40, y: 350, width: 80, height: 40)
        소지금.text = "소지금"
        view.addSubview(소지금)
        
        결제금액.frame = CGRect(x: 40, y: 420, width: 80, height: 40)
        결제금액.text = "결제금액"
        view.addSubview(결제금액)
        
        소지금가격.frame = CGRect(x: 120, y: 350, width: 80, height: 40)
        소지금가격.text = "\(소지금_디폴트)원"
        view.addSubview(소지금가격)
        
        결제금액가격.frame = CGRect(x: 120, y: 420, width: 80, height: 40)
        결제금액가격.text = "0원"
        view.addSubview(결제금액가격)
        
        초기화.frame = CGRect(x: 270, y: 350, width: 80, height: 40)
        초기화.setTitle("초기화", for: .normal)
        초기화.addTarget(self, action: #selector(초기화터치), for: .touchUpInside)
        view.addSubview(초기화)
        
        결제.frame = CGRect(x: 270, y: 420, width: 80, height: 40)
        결제.setTitle("결제", for: .normal)
        결제.addTarget(self, action: #selector(결제터치), for: .touchUpInside)
        view.addSubview(결제)
    }
    @objc func jNoodleOrderTouched() {
        jNoodleCount = jNoodleCount + 1
        jNoodleVolume.text = "\(jNoodleCount)"
        OrderPrice = OrderPrice + 5000
        결제금액가격.text = "\(OrderPrice)원"
    }
    @objc func seaNoodleOrerTouched() {
        seaNoodleCount = seaNoodleCount + 1
        seaNoodleVolume.text = "\(seaNoodleCount)"
        OrderPrice = OrderPrice + 6000
        결제금액가격.text = "\(OrderPrice)원"
    }
    @objc func tangOrderTouched() {
        tangCount = tangCount + 1
        tangVolume.text = "\(tangCount)"
        OrderPrice = OrderPrice + 12000
        결제금액가격.text = "\(OrderPrice)원"
    }
    @objc func 초기화터치() {
        jNoodleVolume.text = "0"
        seaNoodleVolume.text = "0"
        tangVolume.text = "0"
        OrderPrice = 0
        결제금액가격.text = "\(OrderPrice)원"
        소지금_디폴트 = 70000
        소지금가격.text = "\(소지금_디폴트)원"
    }
    
    @objc func 결제터치(_ sender: Any) {
        if 소지금_디폴트 > OrderPrice {
            let alretController = UIAlertController(
                title: "결제하기",
                message: "총 결제 금액은 \(OrderPrice)원입니다.",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "확인", style: .default){
                _ in
             
            }
            alretController.addAction(okAction)
            
            let cancleAction = UIAlertAction(title: "취소", style: .cancel) { _ in
                print("cancel")
            }
            alretController.addAction(cancleAction)
            
            present(alretController, animated: true)
             소지금_디폴트 -= OrderPrice
             소지금가격.text = "\(소지금_디폴트)원"
        }
        else if 소지금_디폴트 < OrderPrice {
            let alretController = UIAlertController(
                title: "결제 실패",
                message: "소지금액이 부족합니다",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "확인", style: .default){
                _ in
             
            }
            alretController.addAction(okAction)
            present(alretController, animated: true)
        }
    }
}

