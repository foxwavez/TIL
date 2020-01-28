//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CustomCellViewController: UIViewController {
  
  let flowLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(
    frame: view.frame, collectionViewLayout: flowLayout
  )
  
  let itemCount = 120
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
  }

  // MARK: Setup Views
  
  private func setupCollectionView() {
  }
  
  private func setupFlowLayout() {
  }
  
  private func setupNavigationItem() {
    let changeItem = UIBarButtonItem(
      barButtonSystemItem: .refresh,
      target: self,
      action: #selector(changeCollectionViewItems(_:))
    )
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply,
      target: self,
      action: #selector(changeCollectionViewDirection(_:))
    )
    navigationItem.rightBarButtonItems = [changeItem, changeDirection]
  }
  
  // MARK: Action
  
  @objc private func changeCollectionViewItems(_ sender: Any) {
  }
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = flowLayout.scrollDirection
    flowLayout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
  }
  
}

// MARK: - UICollectionViewDataSource

extension CustomCellViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}
