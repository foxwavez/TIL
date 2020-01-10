//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by giftbot on 2020. 01. 05..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {

  // MARK: Properties
  
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var imageView: UIImageView!
    
    private var zoomScale: CGFloat = 1.0 {
        didSet {
            print("Current Zoom Scle:", String(format: "%.2f", zoomScale))
        }
    }
   
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
//    scrollView.bounds = true
    // scrollView에 딱 맞는 사이즈가 되어도 스크롤 가능,bounds 효과 가로 세로 별도
    scrollView.alwaysBounceHorizontal = true
    scrollView.alwaysBounceVertical = true
    updateScrollViewScale()
  }
    
    private func updateScrollViewScale() {
        let widthScale = view.frame.width / imageView.bounds.width
        let heightScale = view.frame.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = 1
        scrollView.maximumZoomScale = 3
    }
  
  // MARK: Action Handler
  
  @IBAction private func fitToWidth(_ sender: Any) {
    print("\n---------- [ fitToWidth ] ----------")
    zoomScale = scrollView.frame.width / imageView.bounds.width
    scrollView.setZoomScale(zoomScale, animated: true)
    print(zoomScale)
    
  }
  
  @IBAction private func scaleDouble(_ sender: Any) {
    print("\n---------- [ scaleDouble ] ----------")
    scrollView.setZoomScale(zoomScale * 2, animated: true)
    zoomScale = scrollView.zoomScale
    // 실제 결과 최종 scrollView의 zoomScale 값이 다르다
    // scrollView의 zoomScale은 maximum/minimuZoomSclae에서 정한 값을 벗어나지 않는다
    
//    let rectToVisible = CGRect(x: 100, y: 100, width: 200, height: 300)
//    scrollView.zoom(to: rectToVisible, animated: true)
    // zoom 이 배율이 얼만큼 될건지는 위에 있는 코드가 정해준다
    print(zoomScale)
    
  }

  @IBAction private func moveContentToLeft(_ sender: Any) {
    print("\n---------- [ moveContentToLeft ] ----------")
    let newOffset = CGPoint(x: scrollView.contentOffset.x + 150, y: scrollView.contentOffset.y)
    scrollView.setContentOffset(newOffset, animated: true)
  }
}
 
// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    // 뭐를 줄이는지 뷰를 통해서 설정을 해야 한다
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 스크롤로 움직일 때마다 호출 되는 메서드
        // 프린트를 넣으면 움직일 때마다 프린트가 찍힌다
    }
}
