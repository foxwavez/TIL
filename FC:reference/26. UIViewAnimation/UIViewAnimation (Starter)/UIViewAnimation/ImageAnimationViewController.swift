//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
  
  let images = [
    "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
    ].compactMap(UIImage.init(named:))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.animationImages = images
  }
  
    // Start 버튼 누르면 이미지 animation으로 보여지게
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating()
  }
  
    //  Stop 버튼 누르면 이미지 animaion 멈추게
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else { return }
    imageView.stopAnimating()
  }
  
    // duratuion = 한 사이클?
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)"
    imageView.animationDuration = sender.value
//    default 0 1/30
  }
  
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {
    let repeatCount = Int(sender.value)
    repeatCountLabel.text = "\(repeatCount)"
    imageView.animationRepeatCount = repeatCount
    // Defualt 0 - 무한 반복
  }
}
