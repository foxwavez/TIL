//
//  Singleton.swift
//  DominosUpgradde
//
//  Created by Hailey Lee on 2020/01/29.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation

final class Singleton {
  static let shared = Singleton()
  private init() {}
  
  var wishListDict: [String: Int] = [:]
}
