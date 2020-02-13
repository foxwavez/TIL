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
    print("start")
    bigTask()
    // Main Thread는 Serial Queue
    // asynx를 명시하지 않으면 sync처럼 동작
    // bigTask가 완전히 끝나야 다음 작업을 수행할 수 있다
    // 무조건 순서대로 작업하기 때문에 color Change 버튼을 눌러도 색 바뀌는 동작을 할 수 없다
    print("end")
  }
  
  
  @IBAction func uiTaskOnBackgroundThread() {
    print("\n---------- [ uiTaskOnBackgroundThread ] ----------\n")
    
    DispatchQueue.global().async { // concurrent - async
      self.bigTask()
      self.buttonDidTap(self)
    }
    // Global Queue는 concurrency queue
    // color 변화는 UI 관련 작업이기 때문에 global queue에서 처리하면
    // 색이 늦게 바뀌거나 충돌이 날 수 있다.
    // color 변화는 main thread에서 동작하도록 main queue에 전달해야 함
  }
  
  
  func log(_ str: String) {
    print(str, terminator: " - ")
  }
  
  @IBAction private func serialSyncOrder(_ sender: UIButton) {
    print("\n---------- [ Serial Sync ] ----------\n")
    let serialQueue = DispatchQueue(label: "kr.giftbot.serialQueue") // 이렇게 custmon que를 만들 수 있다
    serialQueue.sync { log("1") } // sync - 호출한 함수가 종료되어야 다음 작업 진행
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
    // abc 순서 동일, 123 순서 동일
    // Dispatch queue에 작업을 전달하면, queue가 작업을 갖고 있다가 system의 적절한 시점에 여유 thread에 작업을 할당함
    // Async는 queue에 작업을 넘기고 바로 종료. 다음 실행으로 넘어감
    // 작업을 넘긴 queue가 serial queue이기 때문에 123 순서 동일
    // sync와 async의 차이: async는 앞에 것이 실행된 상태에서 등록된 것인지. 남아있는 상태에서 등록된 것인지 알 수 없지만, sync는 2가 등록될 시점에는 1은 반드시 끝나있고 3이 등록될 시점에는 2는 반드시 끝나있음
    log("A")
    serialQueue.async { self.log("2") }
    log("B")
    serialQueue.async { self.log("3") }
    log("C")
    print()
    
    // sync: 호출한 작업이 끝나야 다음으로 넘어감
    // 동작하는 과정, 순서? 조건을 이해
  }
  
  @IBAction private func concurrentSyncOrder(_ sender: UIButton) {
    print("\n---------- [ Concurrent Sync ] ----------\n")
    let concurrentQueue = DispatchQueue(
      label: "kr.giftbot.concurrentQueue",
      attributes: [.concurrent]
    )
    concurrentQueue.sync { log("1") } // 호출한 작업이 끝나야 다음으로 넘어간다
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
//    concurrentQueue.async(qos: .userInteractive, execute: { self.log("1") })
    log("A") // queue랑 관계없이 main에서 실행
    concurrentQueue.async { self.log("2") }
    log("B")
    concurrentQueue.async { self.log("3") }
    log("C")
    concurrentQueue.async { self.log("4") }
    log("D")
    print()
    // ABCD 고정 1234랜덤
    // concurent queue이므로 먼저 등록된 작업은 상대적으로 빨리 실행된 가능성이 높은 것일 뿐 1234 작업이 queue에 등록되는 순서와 상관없이 실행되는 순서는 보장되지 않음
  }
  
    // 보통 sync를 작업하게 되는 상황은 거의 없다.
    // async를 주로 사용하게 된다고 기억해야 한다.
    
    // 작업간에 우선순위를 정해주기 위해서는 qos: .userInteraive를 사용한다
    // 하나의 큐만의 테스크에서는 우선순위가 없다. 단일 큐는 무조건 FIFO 구조
  
  
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
    workItem.wait() // async를 원하는 시점에 sync처럼 동작. 실행이 완료될 때ㅁ까지 대기
    print("after waiting")
  }
  
  
  let inactiveQueue = DispatchQueue(
    label: "kr.giftbot.inactiveQueue",
    attributes: [.initiallyInactive, .concurrent]
        // 제일 처음에 Inactive 상태로 만들어준다
  )
  
  @IBAction func initiallyInactiveQueue() {
    print("\n---------- [ initiallyInactiveQueue ] ----------\n")

    let workItem = createDispatchWorkItem()
    inactiveQueue.async(execute: workItem) // 현재 활성화된 상태가 아니다.
    // activate를 해주지 않아서
    
    print("= Do Something... =")
    
    // 필요한 타이밍에 activate 메서드를 통해 활성화
//    inactiveQueue.activate() // -> activate를 해주면 활성화 된다
    // 이러면 실행해도 한 번만 실행된다
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
    
//    queue1.async { calculate(task: 1, limit: 12_000_000); print("The end") }
//    queue1.async { calculate(task: 2, limit:  5_000_000) }
//    queue2.async { calculate(task: 3, limit:  2_000_000) }
    
    let group = DispatchGroup()
    queue1.async(group: group) { calculate(task: 1, limit: 12_000_000) }
    queue1.async(group: group) { calculate(task: 2, limit:  5_000_000) }
    queue2.async(group: group) { calculate(task: 3, limit:  2_000_000) }
    group.notify(queue: .main) { print("The end") }
  }
  
  
  var myWorkItem: DispatchWorkItem!
  
  @IBAction func cancelDispatchWorkItem() {
    myWorkItem = DispatchWorkItem {
      let bigNumber = 8_000_000
      let divideNumber = bigNumber / 4
      for i in 1...bigNumber {
        guard i % divideNumber == 0 else { continue }
        guard !self.myWorkItem.isCancelled else { return }
        print(i / divideNumber * 25, "%")
      }
    }

    DispatchQueue.global().async(execute: myWorkItem)
    // 3초 안에 실행 안되면 취소
    
    let timeLimit = 3.0 // timeLimt를 3.0 -> 10.0으로 바꾸면 sucess 된다
    DispatchQueue.global().async {
        let timeoutResult = self.myWorkItem.wait(timeout: .now() + timeLimit)
        switch timeoutResult {
        case .success: print("sucess within \(timeLimit) seconds")
        case .timedOut:
            self.myWorkItem.cancel()
            print("Timed out")
        }
    }
  }
}
