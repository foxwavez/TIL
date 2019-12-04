//
//  SecondViewController.swift
//  19-12-03_Task_segue
//
//  Created by Hailey Lee on 2019/12/03.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var allCountBtn: UIButton!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = image
        allCountBtn.addTarget(self, action: #selector(allCountBtnTouched), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let firstVC = segue.destination as? FirstViewController else { return }
        
    }
    
    var dogCount = 0
    var catCount = 0
    var birdCount = 0
    
    @objc private func allCountBtnTouched() {
        
        guard let firstVC = presentingViewController as? FirstViewController else { return }
        
//        if firstVC.dogCount < 8 {
//          firstVC.dogCount = firstVC.dogCount + 1
//        }
//        if firstVC.catCount < 10 {
//            firstVC.catCount = firstVC.catCount + 1
//        }
//        if firstVC.birdCount < 15 {
//           firstVC.birdCount = firstVC.birdCount + 1
//        }
//        firstVC.label.text = "(\(firstVC.dogCount),\(firstVC.catCount),\(firstVC.birdCount))"
//
        // 전체를 카운트 역할 : allcounttouched 함수
        
        //switch : firstVC.dogCount < 8 -> true -> firstVC.dogCount += 1
        switch firstVC.dogCount {
        case ..<8:
            firstVC.dogCount = firstVC.dogCount + 1
        default:
            firstVC.dogCount = firstVC.dogCount + 0
        }

        // switch : firstVC.catCount < 10 -> true -> firstVC.catCount += 1
        switch firstVC.catCount {
        case ..<10:
            firstVC.catCount = firstVC.catCount + 1
        default:
            firstVC.catCount = firstVC.catCount + 0
        }

        switch firstVC.birdCount {
        case ..<15:
            firstVC.birdCount = firstVC.birdCount + 1
        default:
            firstVC.birdCount = firstVC.birdCount + 0
        }

        firstVC.label.text = "(\(firstVC.dogCount),\(firstVC.catCount),\(firstVC.birdCount))"

//        switch true {
//        case firstVC.dogCount < 8:
//            firstVC.dogCount = firstVC.dogCount + 1
//            firstVC.catCount = firstVC.catCount + 1
//            firstVC.birdCount = firstVC.birdCount + 1
//            firstVC.label.text = "(\(firstVC.dogCount),\(firstVC.catCount),\(firstVC.birdCount))"
//        case firstVC.catCount < 10:
//            firstVC.catCount = firstVC.catCount + 1
//            firstVC.birdCount = firstVC.birdCount + 1
//            firstVC.label.text = "(\(firstVC.dogCount),\(firstVC.catCount),\(firstVC.birdCount))"
//        case firstVC.birdCount < 15:
//            firstVC.label.text = "(\(firstVC.dogCount),\(firstVC.catCount),\(firstVC.birdCount))"
//        default :
//            return
//        }
        
        
        
        
        // 일단 세컨드뷰에서 var dogCount선언 초기화 하는 것 부터 모르겠다
    }
    //    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //
    //    } // shouldePerformSeegue는 화면을 띄울지 말지 확인하는 기능이라
            // 안에서 guard let을 해서 firstView의 값에 접근할 수 가 없다
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
