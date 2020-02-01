//
//  Pets.swift
//  CustomLogExample
//
//  Created by giftbot on 2020/01/30.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

//dog는 class 이기 때문에 NSObject를 상속 받을 수 있다
class Dog: NSObject {
    
  let name = "Tory"
  let age = 5
  let feature: [String: String] = [
    "breed": "Poodle",
    "tail": "short"
  ]
    
    override var description: String {
        "Dog's name: \(name), age: \(age)"
    }
    override var debugDescription: String {
        "Dog's name: \(name), age: \(age), feature:\(feature)"
    }
}


// cat은 sturct이기 때문에 CustomStringConvertible, CustomDebugStringConvertible 상속받아야함
struct Cat: CustomStringConvertible, CustomDebugStringConvertible {
  let name = "Lilly"
  let age = 2
  let feature: [String: String] = [
    "breed": "Koshort",
    "tail": "short"
  ]
    var description: String {
        "Cat's name: \(name), age: \(age)"
    }
    var debugDescription: String {
        "Cat's name: \(name), age: \(age), feature:\(feature)"
    }
}
