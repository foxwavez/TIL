//: [Previous](@previous)
import Foundation
/*:
 ---
 # Defer
 ---
 */
/*
 현재 코드 블럭이 종료되기 직전에 반드시 실행되어야 하는 코드 등록
 해당 범위가 종료될 때까지 실행을 연기하며 소스 코드에 기록된 순서의 역순으로 동작
*/

// 스위프트는 파이널리가 없어서 defer를 이용하게 된다.

print("\n---------- [ deferOrder 1 ] ----------\n")

func throwError() throws {
  throw NSError(domain: "Domain", code: 1, userInfo: nil)
}
func deferExample() {
  /*
   문자열 출력 순서는??
   1) do 문에서 오류가 발생했을 때
   2) do 문에서 오류가 발생하지 않았을 때
   */
  defer { print("1) First defer") }
  
  do {
    print("2) Do")
    try throwError() // 에러가 발생 할 떄 catch 아래에 코드 블록이 실행된다.
  } catch { //에러가 발생하지 않았을 때는 tryError()가 주석처리 되어있을 때 catch 아래 블록이 실행 아노딤
    return print("3) Error :", error)
  }
  defer { print("4) Second defer") } //defer가 호출이 되어야 위에 defer { print ("1) First defer") } 이 등록이 된다
  print("5) Last Print")
}
deferExample()



print("\n---------- [ deferOrder 2 ] ----------\n")

func deferOrder() {
  print("start")
  defer { print("defer1") }
  print("center")
  defer { print("defer2") }
  defer { print("defer3") }
  print("end")
}
deferOrder()



print("\n---------- [ defer within while loop ] ----------\n")

func sumOddNumbersFromOneToHundred() {
  var sum = 0
  var i = 1
  while i <= 100 {
    defer { i += 1 } // 밑 코드블록에 무슨 처리를 하든 while문이 종료되기 직전에 defer 코드블록이 실행되게 된다
    if i % 2 == 0 {
        continue // 다음 반복자 - 반복문의 다음으로 넘어가게 아래 sum +=1을 무시하고 while문으로
    }
    sum += i
  }
  print(sum)
}
sumOddNumbersFromOneToHundred()



//: [Next](@next)
