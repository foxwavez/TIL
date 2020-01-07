//
//  Singleton.swift
//  Domino
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

final class Singleton {
  static let shared = Singleton()
  private init() {}
  
  var wishListDict: [String: Int] = [:]
}
