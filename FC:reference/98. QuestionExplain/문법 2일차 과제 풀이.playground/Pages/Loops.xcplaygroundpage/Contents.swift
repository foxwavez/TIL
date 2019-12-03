//: [Previous](@previous)

import Foundation


/*
 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
 (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
 ex) 5! = 5 x 4 x 3 x 2 x 1
 */

func factorial(number: Int) -> Int {
  var answer = 1
  for i in 1...number {
    answer *= i
  }
  return answer
}

factorial(number: 4)
factorial(number: 6)


/*
 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
 (2, 5 를 입력한 경우 결과는 2의 5제곱)
 */

func myPow(base: Int, power: Int) -> Int {
  var result = 1
  for _ in 1...power {
    result *= base
  }
  return result
}

myPow(base: 2, power: 10)
myPow(base: 5, power: 3)


/*
 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
 (1234 인 경우 각 자리 숫자를 합치면 10)
 */

func addEachDigitNumber(_ number: Int) -> Int {
  var sum = 0
  var dividedNum = number
  while dividedNum != 0 {
    sum += dividedNum % 10
    dividedNum /= 10
  }
  return sum
}

addEachDigitNumber(1543)
addEachDigitNumber(192837465)
addEachDigitNumber(351)



//: [Next](@next)
