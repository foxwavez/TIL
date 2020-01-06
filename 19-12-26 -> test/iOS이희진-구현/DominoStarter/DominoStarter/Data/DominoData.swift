//
//  DominoData.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

struct Menu {
  var category: String
  var products: [Product]
}

struct Product {
  var name: String
  var price: Int
  var image: String
}



struct Section {
    var name: String
}

//  데이터 예시

let sextionData: [Section] = [
    Section(name: "슈퍼시드 함유 도우"),
    Section(name: "프리미엄"),
    Section(name: "클래식"),
    Section(name: "사이드 디시"),
    Section(name: "음료"),
    Section(name: "피클&소스")
]


let menuData: [Menu] = [
  Menu(
    category: "슈퍼시드",
    products: [
      Product(name: "글램핑 바비큐", price: 10000, image: "글램핑 바비큐"),
      Product(name: "알로하 하와이안", price: 10000, image: "알로하 하와이안"),
      Product(name: "우리 고구마", price: 10000, image: "우리 고구마"),
      Product(name: "콰트로 치즈 퐁듀", price: 10000, image: "콰트로 치즈 퐁듀")
    ]
  ),
  Menu(
    category: "프리미엄",
    products: [
        Product(name: "베이컨체더치즈", price: 20000, image: "베이컨체더치즈"),
        Product(name: "불고기", price: 20000, image: "불고기"),
        Product(name: "슈퍼디럭스", price: 20000, image: "슈퍼디럭스"),
        Product(name: "슈퍼슈프림", price: 20000, image: "슈퍼슈프림"),
        Product(name: "페퍼로니", price: 20000, image: "페퍼로니"),
        Product(name: "포테이토", price: 20000, image: "포테이토")
  ]
    ),
  Menu(
    category: "클래식",
    products: [
        Product(name: "더블크러스트 이베리코", price: 10000, image: "더블크러스트 이베리코"),
        Product(name: "블랙앵거스 스테이크", price: 10000, image: "블랙앵거스 스테이크"),
        Product(name: "블랙타이거 슈림프", price: 10000, image: "블랙타이거 슈림프"),
        Product(name: "와규 앤 비스테카", price: 10000, image: "와규 앤 비스테카"),
        Product(name: "직화 스테이크", price: 10000, image: "직화 스테이크")
  ]
    ),
  Menu(category: "사이드 디시",
       products: [
        Product(name: "딸기 슈크림", price: 2000, image: "딸기 슈크림"),
        Product(name: "슈퍼곡물 치킨", price: 2000, image: "슈퍼곡물 치킨"),
        Product(name: "애플 크러스트 디저트", price: 2000, image: "애플 크러스트 디저트"),
        Product(name: "치킨퐁듀 그라탕", price: 2000, image: "치킨퐁듀 그라탕"),
  ]
    ),
  Menu(category: "음료",
       products: [
        Product(name: "미닛메이드 스파클링 청포도", price: 2000, image: "미닛메이드 스파클링 청포도"),
        Product(name: "스프라이트", price: 2000, image: "스프라이트"),
        Product(name: "코카콜라 제로", price: 2000, image: "코카콜라 제로"),
        Product(name: "코카콜라", price: 2000, image: "코카콜라")
  ]
    ),
  Menu(
    category: "피클&소스",
    products: [
        Product(name: "갈릭 디핑 소스", price: 500, image: "갈릭 디핑 소스"),
        Product(name: "스위트 칠리소스", price: 500, image: "스위트 칠리소스"),
        Product(name: "우리 피클 L", price: 500, image: "우리 피클 L"),
        Product(name: "우리 피클 M", price: 500, image: "우리 피클 M"),
        Product(name: "핫소스", price: 500, image: "핫소스")
  ]
    )
]
