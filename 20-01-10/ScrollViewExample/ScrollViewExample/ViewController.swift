//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Hailey Lee on 2020/01/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        setPageControl()
    }
  
    private func setPageControl() {
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
        // UIScreen  -> 해당 디바이스의 스크린 전체 크기
        
        pageControll.isUserInteractionEnabled = false
        // isUserInterationEnabled: 사용자 이벤트가 무시되고 이벤트 큐에서 제거되는지 여부를 결정하는 부울 값입니다.
        // pageControll의 이벤트를 무시하지 말라고 false 값을 주었다
    }
}

// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        // contentOffset.x는 모든 페이지가 합쳐진 width 길이
        // UIScreen.main.boinds.width는 디바이스 화면에 나오는 뷰
        // pageControll은 width가 어디서부터 어디까지 현재 화면을 뜻하는지 알지 못한다
        // 그래서 알려주기 위해서 contentOffset.x / UIScreen.main.boinds.width
        // 나눠서 현재 페이지를 알려준다
        // currentPage 현재 페이지가 어느 시점부터
        
    }
}

