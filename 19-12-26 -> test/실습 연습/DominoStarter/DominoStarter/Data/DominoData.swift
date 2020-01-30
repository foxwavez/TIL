//
//  DominoData.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

struct Menu {
  let category: String
  let products: [Product]
}

struct Product {
  let name: String
  let price: Int
}

//  데이터 예시

let menuData: [Menu] = [
  Menu(
    category: "슈퍼시드",
    products: [
      Product(name: "글램핑 바비큐", price: 10000),
      Product(name: "알로하 하와이안", price: 10000),
      Product(name: "우리 고구마", price: 10000),
      Product(name: "콰트로 치즈 퐁듀", price: 10000)
    ]
  )
]
