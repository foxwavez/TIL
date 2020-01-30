//: [Previous](@previous)
import Foundation

/*:
 ---
 ## Practice
 ---
 */

/*
 [ 1번 문제 ]
 let numbers = [-2, -1, 0, 1, 2]
 numbers.compactMap { $0 >= 0 ? $0 : nil }
 => [0, 1, 2]
 
 위와 같이 compactMap을 이용했을 때와 동일한 결과가 나오도록 compactMap 없이 구현
 */

print("\n---------- [ 1번 문제 ] ----------\n")

let numbers = [-2, -1, 0, 1, 2]
numbers


let removeNil = numbers
  .map { $0 >= 0 ? $0 : nil }
  .filter { $0 != nil }
  .map { $0! }
print(removeNil)




/*
 [ 2번 문제 ]
 
 let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
 nestedArr.flatMap { $0 }
 => [1, 2, 3, 9, 8, 7, -1, 0, 1]
 
 위와 같이 flatMap을 이용했을 때와 동일한 결과가 나오도록 flatMap 없이 구현
 */

print("\n---------- [ 2번 문제 ] ----------\n")

let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
nestedArr


// 1) map + reduce를 이용한 방법
let mapReduce = nestedArr
  .map { $0 }
  .reduce([], +)
print(mapReduce)

// reduce 동작 순서
// [] + [1, 2, 3] = [1, 2, 3]
// [1, 2, 3] + [9, 8, 7] = [1, 2, 3, 9, 8, 7]
// [1, 2, 3, 9, 8, 7] + [-1, 0, 1] = [1, 2, 3, 9, 8, 7, -1, 0, 1]


// 2) map + joined를 이용한 방법
// 실제 swift 내부 구현 코드는 joined 함수를 이용
let flattenArr = nestedArr
  .map { $0 }
  .joined()
print(Array(flattenArr))





/*
 [ 3번 문제 ]
 Q. map 과 flatMap, compactMap 을 이용하여 다음 3가지 결과값이 나오도록 출력해보기
 
 1. [[1, 2, 3], [5], [6], []]
 2. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil] 
 3. [1, 2, 3, 5, 6]
 */

print("\n---------- [ 3번 문제 ] ----------\n")

let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]

let a1 = array.map ({ $0.compactMap({ $0 }) })
let a2 = array.flatMap({ $0 })
let a3 = array.flatMap({ $0.compactMap({ $0 }) })
print(a1)
print(a2)
print(a3)

//: [Next](@next)
