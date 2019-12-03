
import Foundation


/*
 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 문자열로 반환하는 함수
 1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100
 */

func attachTwoNumbers(lhs: Int, rhs: Int) -> String {
  "\(lhs)\(rhs)"
}

attachTwoNumbers(lhs: 1, rhs: 5)
attachTwoNumbers(lhs: 29, rhs: 30)
attachTwoNumbers(lhs: 6, rhs: 100)


/*
 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
 */

func isEqualString(lhs: String, rhs: String) -> Bool {
  lhs == rhs
}

isEqualString(lhs: "헬로", rhs: "헬로")
isEqualString(lhs: "iOS", rhs: "Swift")



/*
 자연수 하나를 입력받아 그 수의 약수를 모두 출력하는 함수
 */
func printDivisors(of number: Int) {
  print("\(number)의 약수 :", terminator: " ")
  for i in 1...number {
    if number.isMultiple(of: i) {
      print(i, terminator: " ")
    }
  }
  print()
}

printDivisors(of: 14)
printDivisors(of: 19)
printDivisors(of: 20)


/*
 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
 */

func printCommonMultipleOfThreeAndFive() {
  for i in 1...100 {
    if i.isMultiple(of: 3), i.isMultiple(of: 5) {
      print(i)
    }
  }
}

printCommonMultipleOfThreeAndFive()





//: ### [ 도전 과제 ]
/*
 2 이상의 자연수를 입력받아, 소수인지 아닌지 판별하는 함수
 */

func isPrimeNumber(_ number: Int) -> Bool {
  guard number > 1 else { return false }
  guard number != 2 else { return true }
  
  for i in 2..<number {
    if number % i == 0 {
      return false
    }
  }
  return true
}

isPrimeNumber(15)
isPrimeNumber(33)
isPrimeNumber(94)

isPrimeNumber(2)
isPrimeNumber(17)
isPrimeNumber(23)



/*
 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
 - 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
   e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
 - 함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
 */

func fibonacciNumber(at index: Int) -> Int {
  var op1 = 0, op2 = 1
  
  for i in 0..<index {
    if i % 2 == 0 {
      op1 += op2
    } else {
      op2 += op1
    }
  }
  
  return index % 2 == 0 ? op1 : op2
}

fibonacciNumber(at: 0)
fibonacciNumber(at: 1)
fibonacciNumber(at: 2)
fibonacciNumber(at: 3)
fibonacciNumber(at: 4)
fibonacciNumber(at: 5)
fibonacciNumber(at: 6)



/*
 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
 (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
     윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 */

func isLeapYear(_ year: Int) -> Bool {
  // 1)
  if year.isMultiple(of: 400) {
    return true
  } else if year.isMultiple(of: 100) {
    return false
  } else {
    return year.isMultiple(of: 4)
  }
  
  // 2)
//  return year.isMultiple(of: 400) || !year.isMultiple(of: 100) && year.isMultiple(of: 4)
}

isLeapYear(2000)
isLeapYear(2004)

isLeapYear(1000)
isLeapYear(1970)
isLeapYear(2002)
