//: [Previous](@previous)
import Foundation


/*
 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
 그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 */
func sumNumbers(max: Int) -> Int {
  var sum = 0
  for i in 1...max {
    sum += i
    if sum > 2000 { return sum }
  }
  return sum
}

sumNumbers(max: 10)
sumNumbers(max: 50)
sumNumbers(max: 63)
sumNumbers(max: 80)
sumNumbers(max: 100)



/*
 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */

func sumNumbers() {
  var sum = 0
  for i in 1...50 {
    if 20...30 ~= i { continue }
    sum += i
  }
  print(sum)
}

sumNumbers()


//: [Next](@next)
