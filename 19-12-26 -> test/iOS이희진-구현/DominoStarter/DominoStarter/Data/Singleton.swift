//
//  Singleton.swift
//  DominoStarter
//
//  Created by Hailey Lee on 2020/01/10.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    // static은 어디서나 접근이 가능하게 한다
    private init() {}
    var wishListDict: [String : Int] = [:]
}


let wishPizza = Singleton.shared
