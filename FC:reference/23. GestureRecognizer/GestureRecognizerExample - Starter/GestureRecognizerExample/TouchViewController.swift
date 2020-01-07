//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    
    // 이미지뷰일 경우 아래 코드를 작성해야 실제로 네모난 형태에서 동그란 형태로 바뀐다
    // 이미지뷰는 동그랗게 변했지만 들어간 이미지(cat1)은 변하지 않았기 때문
    imageView.clipsToBounds = true
//    imageView.layer.masksToBounds = true
    // 둘 중에 하나를 작성하면 된다
    
  }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return } //touch를 했을 때 이벤트의 정보를 가져온다 (손가락이 여러개 일 수 있어서 여러 정보를 받는다)
        let touchPoint = touch.location(in: touch.view) // touchePoint는 내가 터치한 위치의 x, y값 (여러 개 중에서 한 손가락 정보)
        
        // 이미지 뷰 공간만 터치했을 때 이미지가 변화하도록 하려면 아래 코드 작성
        
        if imageView.frame.contains(touchPoint){
            imageView.image = UIImage(named: "cat2")
        }
        
        print(touchPoint)
    }
    
    var isHoldingImage = false
    var lastTouchPoint = CGPoint.zero
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesMoved는 터치하고 움직일 때마다 계속 호출 되는 함수
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
//        if imageView.frame.contains(touchPoint) {
//            imageView.center = touchPoint
//            // 이미지의 중심점을 내가 터치한 위치로 계속 업데이트 한다
//        }
        let prevTouchPoint = touch.previousLocation(in: touch.view)
        
        if imageView.frame.contains(touchPoint) {
            let dx = touchPoint.x - prevTouchPoint.x
            let dy = touchPoint.y - prevTouchPoint.y
            
            imageView.center.x = imageView.center.x + dx
            imageView.center.y = imageView.center.y + dy
        }
        print("\n---------[touchesMoved]--------\n")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        imageView.image = UIImage(named: "cat1")
        print("\n---------[touchesEnded]--------\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        imageView.image = UIImage(named: "cat1")
    }
}



