//
//  FitItemsViewController.swift
//  CollectionViewExample
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class FitItemsViewController: UIViewController {
  
  private enum UI {
    static let itemsInLine: CGFloat = 2 // 한 줄에 몇 개의 아이템이 나오게 할 건지
    static let linesOnScreen: CGFloat = 3 // 화면에 몇 줄의 아이템이 나오게 할 건지
    
    static let itemSpacing: CGFloat = 10.0 //
    static let lineSpacing: CGFloat = 10.0 //
    static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
  var parkImages = ParkManager.imageNames(of: .nationalPark)
  
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
     super.viewDidLoad()
     setupCollectionView()
     setupNavigationItem()
    
     // setupFlowLayout() 시점별(life cycle)로 setupFlowLayout 호출 시 화면 표시 되는 거 잘 봐둘 것
    // viewDidLoad에서는 safeAreaGuide를 잡아서 화면이 나오는 순간이 아니기 때문에
    // viewWillLayoutSubviews에서 setupFlowLayout()을 해줘야 한다.
//    view.safeAreaInset은 safeAreaguide 바깥에 영역
   }

    
//    override func viewSafeAreaInsetsDidChange() {
//        super.viewSafeAreaInsetsDidChange()
//        self.setupFlowLayout()
//    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupFlowLayout() //safeAreaInset을 위해
        // 스크롤을 아래로 했을 때 타이틀이 Large 타이틀에서 네비게이션 안에 타이틀로 조그맣게 변하기 때문에
        // safeAreaInset의 길의 크기가 작게 변하게 된다 -> 즉 safeAreaGuide 영역이 커지기 때문에
        // viewDidLoad의 순간이 아닌 이 시점에서 setupFlowLayout()을 해줘야 한다.
    }
   
   // MARK: Setup CollectionView
   
   func setupCollectionView() {
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    self.view.addSubview(collectionView)
    self.setupFlowLayout()
   }
   
   func setupFlowLayout() {
    self.layout.minimumInteritemSpacing = UI.itemSpacing
    self.layout.minimumLineSpacing = UI.lineSpacing
    self.layout.sectionInset = UI.edgeInsets
    
    self.fitItemsAndLinesOnScreen()
   }
    
    func fitItemsAndLinesOnScreen() {
        let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1) // 전체 item spacing
        let lineSpaing = UI.lineSpacing * (UI.linesOnScreen - 1) // 전체 line spaing
        let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
        let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom
        let verticalInsetWithSafeArea = verticalInset + self.view.safeAreaInsets.top + self.view.safeAreaInsets.bottom
        
        let isVertical = layout.scrollDirection == .vertical
        let horizontalSpacing = (isVertical ? itemSpacing : lineSpaing) + horizontalInset
        let verticalSpacing = (isVertical ? lineSpaing : itemSpacing) + verticalInsetWithSafeArea
        
        let contentWidth = collectionView.frame.width - horizontalSpacing
        let contntHeight = collectionView.frame.height - verticalSpacing

        let width = contentWidth / (isVertical ? UI.itemsInLine : UI.linesOnScreen)
        let height = contntHeight / (isVertical ? UI.linesOnScreen : UI.itemsInLine)
        
        layout.itemSize = CGSize(
            width: width.rounded(.down),
            height: height.rounded(.down)
        )
        
    }
   
   
   // MARK: Setup NavigationItem
   
   func setupNavigationItem() {
     let changeDirection = UIBarButtonItem(
       barButtonSystemItem: .reply,
       target: self,
       action: #selector(changeCollectionViewDirection(_:))
     )
     navigationItem.rightBarButtonItems = [changeDirection]
   }
   
   // MARK: - Action
   
   @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = layout.scrollDirection
    layout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
    self.setupFlowLayout()
   }
}


// MARK: - UICollectionViewDataSource

extension FitItemsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CustomCell.identifier,
      for: indexPath
      ) as! CustomCell
    cell.backgroundColor = .black
    let item = indexPath.item % parkImages.count
    cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
    return cell
  }
}



