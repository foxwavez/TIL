//
//  ViewController.swift
//  StoryboardSegue
//
//  Created by Hailey Lee on 2019/12/03.
//  Copyright © 2019 Hailey. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var count = 0
    
    @IBOutlet weak var fivePlusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(count)"
        fivePlusButton.addTarget(self, action: #selector(didTapFivePlus), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let plus = identifier == "PlusOne" ? 1 : 10
        return count + plus <= 40
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let secondVC = segue.destination as? SecondViewController else {
            return
        }
        
//        segue.destination // 목적지 SecondVC
//        segue.source // 출발지 FirstVC
//        segue.identifier // 식별자 Card, FullScreen
        
        if segue.identifier == "PlusOne" {
           count = count + 1
            secondVC.text = "\(count)"
        } else {
            count = count + 10
            secondVC.text = "\(count)"
        }
    }
    @objc private func didTapFivePlus(_ sender: UIButton) {
        performSegue(withIdentifier: "PlusFive", sender: sender)
    }
    
    
    @IBAction func unwindToFirstViewContoller(_ unwindSegue: UIStoryboardSegue) {
        guard let secondVC = unwindSegue.source as? SecondViewController else { return }
        count = count - secondVC.minus
        label.text = "Count: \(count)"
    }
    // 코드와 달리 돌아갈 뷰에 unwind를 미리 코드를 작성 한다 그리고 스토리보드에서 버튼을 컨트롤키 누른 상태로 Exit를 연결 해준다
    // full Screen 하는 방법 스토리보드에서 세그웨이를 누른 상태에서 오른쪽 네비 4버째 아이콘 어트리뷰트를 누르고, presentation을 full screen으로 바꾸어 준다.
}

