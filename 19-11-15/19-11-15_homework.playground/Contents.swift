//[ 자율 학습 ]
//1. 지난 과제에서 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기
//2. 클로저 Full Syntax <-> Optimized Syntax 변환 연습


//[ 과제 ]
//1. 객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기



//[ 도전 과제 ]
//1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
//let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}
//let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
//  var count: Int = 0
//  for _ in values {
//    count += 1
//  }
//  return count
//}
