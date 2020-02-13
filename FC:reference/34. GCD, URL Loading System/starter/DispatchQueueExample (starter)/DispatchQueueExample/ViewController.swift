//
//  ViewController.swift
//  DispatchQueueExample
//
//  Created by giftbot on 2020. 2. 12..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var testView: UIView!

  @IBAction private func buttonDidTap(_ sender: Any) {
    print("---------- [ Change Color ] ----------\n")
    let r = CGFloat.random(in: 0...1.0)
    let g = CGFloat.random(in: 0...1.0)
    let b = CGFloat.random(in: 0...1.0)
    testView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
  }

  func bigTask() {
    print("= Big task start =")
    for _ in 0...5_000_000 { _ = 1 + 1 }
    print("= Big task end =")
  }
  
  @IBAction func bigTaskOnMainThread() {
    bigTask()
  }
  
  
  @IBAction func uiTaskOnBackgroundThread() {
    print("\n---------- [ uiTaskOnBackgroundThread ] ----------\n")
    
    DispatchQueue.global().async {
      self.bigTask()
      self.buttonDidTap(self)
    }
  }
  
  
  func log(_ str: String) {
    print(str, terminator: " - ")
  }
  
  @IBAction private func serialSyncOrder(_ sender: UIButton) {
    print("\n---------- [ Serial Sync ] ----------\n")
    let serialQueue = DispatchQueue(label: "kr.giftbot.serialQueue")
    serialQueue.sync { log("1") }
    log("A")
    serialQueue.sync { log("2") }
    log("B")
    serialQueue.sync { log("3") }
    log("C")
    print()
  }
  
  @IBAction private func serialAsyncOrder(_ sender: UIButton) {
    print("\n---------- [ Serial Async ] ----------\n")
    let serialQueue = DispatchQueue(label: "kr.giftbot.serialQueue")
    serialQueue.async { self.log("1") }
    log("A")
    serialQueue.async { self.log("2") }
    log("B")
    serialQueue.async { self.log("3") }
    log("C")
    print()
  }
  
  @IBAction private func concurrentSyncOrder(_ sender: UIButton) {
    print("\n---------- [ Concurrent Sync ] ----------\n")
    let concurrentQueue = DispatchQueue(
      label: "kr.giftbot.concurrentQueue",
      attributes: [.concurrent]
    )
    concurrentQueue.sync { log("1") }
    log("A")
    concurrentQueue.sync { log("2") }
    log("B")
    concurrentQueue.sync { log("3") }
    log("C")
    print()
  }
  
  @IBAction private func concurrentAsyncOrder(_ sender: UIButton) {
    print("\n---------- [ Concurrent Async ] ----------\n")
    let concurrentQueue = DispatchQueue(
      label: "kr.giftbot.concurrentQueue",
      attributes: [.concurrent]
    )
    concurrentQueue.async { self.log("1") }
    concurrentQueue.async(qos: .userInteractive, execute: { self.log("1") })
    log("A")
    concurrentQueue.async { self.log("2") }
    log("B")
    concurrentQueue.async { self.log("3") }
    log("C")
    concurrentQueue.async { self.log("4") }
    log("D")
    print()
  }
  
  
  
  private func createDispatchWorkItem() -> DispatchWorkItem {
    // 출력 순서
    // 25%, 50% , 75%, 100%
    let workItem = DispatchWorkItem {
      let bigNumber = 8_000_000
      let divideNumber = 2_000_000
      for i in 1...bigNumber {
        guard i % divideNumber == 0 else { continue }
        print(i / divideNumber * 25, "%")
      }
    }
    return workItem
  }
  
  
  @IBAction func waitWorkItem() {
    print("\n---------- [ waitWorkItem ] ----------\n")
    
    let workItem = createDispatchWorkItem()
    let myQueue = DispatchQueue(label: "kr.giftbot.myQueue")
    
    // async vs sync
    myQueue.async(execute: workItem)
//    myQueue.sync(execute: workItem)
    
    print("before waiting")
//    workItem.wait()
    print("after waiting")
  }
  
  
  let inactiveQueue = DispatchQueue(
    label: "kr.giftbot.inactiveQueue",
    attributes: [.initiallyInactive, .concurrent]
  )
  
  @IBAction func initiallyInactiveQueue() {
    print("\n---------- [ initiallyInactiveQueue ] ----------\n")

    let workItem = createDispatchWorkItem()
    inactiveQueue.async(execute: workItem)
    
    print("= Do Something... =")
    
    // 필요한 타이밍에 activate 메서드를 통해 활성화
//    inactiveQueue.activate()
  }
  
  
  @IBAction func groupNotify() {
    print("\n---------- [ groupNotify ] ----------\n")
    
    let queue1 = DispatchQueue(label: "kr.giftbot.example.queue1",
                               attributes: .concurrent)
    let queue2 = DispatchQueue(label: "kr.giftbot.example.queue2")
    
    func calculate(task: Int, limit: Int) {
      print("Task\(task) 시작")
      for _ in 0...limit { _ = 1 + 1 }
      print("Task\(task) 종료")
    }
    
    queue1.async { calculate(task: 1, limit: 12_000_000) }
    queue1.async { calculate(task: 2, limit:  5_000_000) }
    queue2.async { calculate(task: 3, limit:  2_000_000) }
  }
  
  
  var myWorkItem: DispatchWorkItem!
  
  @IBAction func cancelDispatchWorkItem() {
    myWorkItem = DispatchWorkItem {
      let bigNumber = 8_000_000
      let divideNumber = bigNumber / 4
      for i in 1...bigNumber {
        guard i % divideNumber == 0 else { continue }
        print(i / divideNumber * 25, "%")
      }
    }

    DispatchQueue.global().async(execute: myWorkItem)
  }
}
