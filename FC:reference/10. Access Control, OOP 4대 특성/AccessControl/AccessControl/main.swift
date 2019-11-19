//
//  main.swift
//  AccessControl
//
//  Created by giftbot on 18/11/2019.
//  Copyright © 2018 giftbot. All rights reserved.
//

import Foundation



/***************************************************
 Internal
 ***************************************************/
print("\n---------- [ Internal ] ----------\n")

let internalClass = InternalClass()
print(internalClass.publicProperty)
print(internalClass.internalProperty)
print(internalClass.defaultProperty)
//print(internalClass.fileprivateProperty)
//print(internalClass.privateProperty)


/***************************************************
 Fileprivate
 ***************************************************/
print("\n---------- [ Fileprivate ] ----------\n")

//접근 불가
//let fileprivateClass = FileprivateClass()

// main -> fileprivateClass
// main -> samefileprivateClass -> fileprivateClass

let anotherClass = SameFileAnotherClass()
anotherClass.someFunction()


/***************************************************
 Private
 ***************************************************/
print("\n---------- [ Private ] ----------\n")

//접근 불가
//let privateClass = PrivateClass() // 프라이빗이라 접근할 수 없다

let someOtherClass = SomeOtherClass()
someOtherClass.someFunction()
