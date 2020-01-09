//
//  Menu.swift
//  DominoExample
//
//  Created by Hailey Lee on 2019/12/26.
//  Copyright © 2019 Hailey. All rights reserved.
//


import UIKit

struct DominoMenu {
    var category: String
    var menus: [Menu]
}


struct Menu {
    var name: String
    var price: Int
    var thumbnail: String
}
