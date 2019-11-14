//: [Previous](@previous)
/*:
 ---
 # Tuples
 ---
 */
/*:
 ---
 ## Unnamed Tuple
 ---
 */
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)
type(of: threeNumbers)

threeNumbers

threeNumbers.0
threeNumbers.1
threeNumbers.2


var threeValues: (Int, Double, String) = (10,  100.0,  "이름")
type(of: threeValues)

threeValues

threeValues.0 = 5
threeValues


/*:
 ## Decomposition
 */

let numbers = threeNumbers
numbers
numbers.0
numbers.1


let (first, second, third) = threeNumbers
first
second
third

// wildcard pattern

let (_, second1, third1) = threeNumbers
second1
third1


/*:
 ---
 ## Named Tuple
 ---
 */

let iOS = (language: "Swift", version: "4")

//let iOS: (language: String, version: String) = (language: "Swift", version: "4")
//let iOS: (language: String, version: String) = ("Swift", "4")
//let iOS = (language: "Swift", version: "4")

iOS.0
iOS.1

iOS.language
iOS.version


func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
  return (a + b.0 , a + b.1)
}

let result = 튜플(a: 10, b: (20, 30))
result.first
result.second


// 0부터 시작하기 때문에 0이 first
/*:
 ## Comparison Operators
 * Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음
 * 7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함
 */
//var something1: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
//var something2: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
//something1 == something2

//var something3: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//var something4: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//something3 == something4


// 다음의 비교 결과는?
(1, "zebra") < (2, "apple")   // true
(3, "apple") > (3, "bird")    // false
("3.14", 99) > ("1.99", 1)    // true
("blue", 1) > ("bluesky", -1) // false
(4, "dog") == (4, "dog")      // true

/*
 Q. 다음 튜플 연산에 대한 결과는?
 
 - ("일", 1) > ("이", 2.0) // true
 - (1, "zebra") < ("2", "apple") // error Int값 1과 String "2" 서로 다른 타입을 비교해서 에러
 - ("blue", false) < ("purple", true) // error - bool 값의 true false는 서로 크고 다름이 없다 그래서 에러
 */



/*:
 ---
 ## Tuple Matching
 ---
 */

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
  print("\(somePoint) is at the origin")
case (_, 0):
  print("\(somePoint) is on the x-axis")
case (0, _):
  print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
  print("\(somePoint) is inside the box")
default:
  print("\(somePoint) is outside of the box")
}


// 같은 코드라고 할 지라도 맨 위에 있는 case가 먼저 실행되기 때문에 순서가 중요하다


/*:
 ## Dictionary Enumeration
 */

let fruits = ["A": "Apple", "B": "Banana", "C": "Cherry"]

for dict in fruits {
    dict.0
    dict.1
    dict.key
    dict.value
}

for (key, value) in fruits {
  print(key, value)
}
print()

//for element in fruits {
//  // 어떤 식으로 출력해야 할까요?
//}


//: [Next](@next)
