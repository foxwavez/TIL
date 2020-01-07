//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
    var isChange = false
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
    imageView.frame.size = CGSize(width: imageView.frame.width, height: imageView.frame.height)
  }
    // TapGesture - Discrete(제스쳐 한 번 인식할 때 한 번만 호출)
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else { return } // 제대로 제스쳐가 실행되어 끝났는 지 확인 하기 위한
       
        if !isChange {
        imageView.frame.size = CGSize(width: imageView.frame.width * 2, height: imageView.frame.height * 2)
        }
        else {
            imageView.frame.size = CGSize(width: imageView.frame.width / 2, height: imageView.frame.height / 2)
        }
        isChange.toggle()
        print("Tap!!")
        
    }
    
    // 이미지 뷰 밖에 화면 뷰에 제스쳐를 입힌 상태
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    // 이미지 뷰 밖에 화면 뷰에 제스쳐를 입힌 상태
    @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
//        if (sender.direction == .left) {
//           print("Swipe Left")
//           imageView.image = UIImage(named: "cat1")
//        }
//        if (sender.direction == .right) {
//              print("Swipe Right")
//              imageView.image = UIImage(named: "cat2")
//           }
        switch sender.direction {
        case .left:
            print("Swipe Left")
            imageView.image = UIImage(named: "cat1")
        case .right:
            print("Swipe Right")
            imageView.image = UIImage(named: "cat2")
        case .down:
            print("Swipe Down")
//            imageView.center = CGPoint(x: imageView.center, y: imageView.center - 100)
        case .up:
            print("Swipe Up")
        default:
            return
        }
        // 스와이프 제스처 하나 당 하나의 움직임만 할 수 있기 때문에 right, left, up, down을 하고 싶으면 4개의 제스처를 지금 현재 함수 에 연결해줘야 한다
    }
    
    var initialCeter = CGPoint()
    //  이미지뷰에 panGesture를 입힌 상태
    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        guard let dragView = sender.view else { return }
        
        let translation = sender.translation(in: dragView.superview)
        
        dragView.isUserInteractionEnabled = true
        
        if sender.state == .began {
           initialCeter = dragView.center
        }
        if sender.state == .cancelled {
            dragView.center = CGPoint(x: initialCeter.x + translation.x, y: initialCeter.y + translation.y)
        } else {
            dragView.center = initialCeter
        }
    }
    
    @IBAction func handleLongPressGesutre(_ sender: UILongPressGestureRecognizer) {
        vibrate()
    }
    
    // import AudioToolbox.AudioSerives
    private func vibrate() {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }
    
}
// Tap은 손가락으로 터치를 눌렀다 뗏을 때를 의미 -> tap 2는 두 번 눌렀다 뗏다 한 상태
// Touch는 손가락으로 누르고 있는 상태를 의미 ->  touch 2는 손가락 2개로 누르고 있는 상태
