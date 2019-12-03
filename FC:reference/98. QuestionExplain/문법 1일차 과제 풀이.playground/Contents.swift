
import Foundation


/***************************************************
 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
 ***************************************************/
func introduceMySelf(withName name: String, age: Int) {
  print("안녕하세요. 제 이름은 \(name)이고 나이는 \(age)살입니다.")
}

introduceMySelf(withName: "Tory", age: 4)


/***************************************************
 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
 ***************************************************/
func isEven1(number: Int) -> Bool {
  return number % 2 == 0
}

func isEven2(number: Int) -> Bool {
  return number.isMultiple(of: 2)
}

isEven1(number: 6)
isEven1(number: 5)
isEven2(number: 6)
isEven2(number: 5)


/***************************************************
 정수를 두 개 입력받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
 ***************************************************/
func multiplyTwoNumbers(op1: Int, op2: Int = 10) -> Int {
  return op1 * op2
}

multiplyTwoNumbers(op1: 20, op2: 5)
multiplyTwoNumbers(op1: 5)


/***************************************************
 4과목의 시험 점수를 입력 받아 평균 값을 반환해주는 함수
 ***************************************************/
func averageScore(score1: Double, score2: Double, score3: Double, score4: Double) -> Double {
  let sum = score1 + score2 + score3 + score4
  return sum / 4
}

averageScore(score1: 79, score2: 85.5, score3: 90.5, score4: 81)


func averageScore(scores: Double...) -> Double {
  var sum = 0.0
  for score in scores {
    sum += score
  }
  return sum / Double(scores.count)
}

averageScore(scores: 79, 85.5, 90.5, 81)


/***************************************************
 점수를 입력받아 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 ***************************************************/
func calculateGrade(from score: Int) -> String {
  let grade: String
  if score >= 90 {
    grade = "A"
  } else if score >= 80 {
    grade = "B"
  } else if score >= 70 {
    grade = "C"
  } else {
    grade = "F"
  }
  return grade
}

calculateGrade(from: 100)
calculateGrade(from: 80)
calculateGrade(from: 50)


/***************************************************
 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 그 평균에 대한 학점을 반환하는 함수 (90점  이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 ***************************************************/

func calculateGrade(from scores: Int...) -> String {
  var sum = 0.0
  for score in scores {
    sum += Double(score)
  }
  sum /= Double(scores.count)
  
  if sum >= 90 {
    return "A"
  } else if sum >= 80 {
    return "B"
  } else if sum >= 70 {
    return "C"
  } else {
    return "F"
  }
}

calculateGrade(from: 81, 95, 70, 60)
calculateGrade(from: 92, 84, 70, 99)
