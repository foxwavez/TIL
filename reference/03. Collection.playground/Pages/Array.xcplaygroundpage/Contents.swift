//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Array
 - Ordered Collection
 - Zero-based Integer Index
 ---
 */
// Zero-based -> 1,2,3 이 아니라 0 부터 시작하는 것 (0, 1, 2, 3)
/*:
 ### Mutable, Immutable
 */

var variableArray = [1, 2]
variableArray = []

let constantArray = [1, 2]
//constantArray = []


/*:
 ### Array Type
 */

var arrayFromLiteral = [1, 2, 3]
arrayFromLiteral = []

//let emptyArray = [] -> 빈 값을 넣는 것

//let emptyArray: [String] = []


/*:
 ### Initialize
 */

// Type Annotation -> 타입을 명시할 떄
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"] // -> 이 형식을 자주 쓰는 편

// Type Inference -> 타입을 명시하지 않을 때
let strArray3 = ["apple", "orange", "melon"]
let strArray4 = Array<String>(repeating: "iOS", count: 5)

// Error
//let strArray5 = ["apple", 3.14, 1]
// ->[Any] 어떤 타입이던지 간에 허용하겠다

/*:
 ---
 ### Question
 - String 타입과 Int 타입으로 각각 자료가 없는 상태인 빈 배열을 만들어보세요.
 - Double 타입은 Type Annotation, Bool 타입은 Type Inference 방식으로 각각 임의의 값을 넣어 배열을 만들어보세요.
 ---
 */
let abc: [String] = ["apple", "banana", "cocoa"]
let number: [Int] = [1, 2, 3, 4]

let def: [Double] = [1.2, 1.3, 1.4]
let hj = [true]
/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")

let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count

if !fruits.isEmpty {
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}


/*:
 ### Retrieve an Element
 */
//              0        1         2
// fruits = ["Apple", "Orange", "Banana", endIndex]

//fruits[0]
//fruits[2]
//fruits[123]

//fruits.startIndex -> 0번째의 apple
//fruits.endIndex -> banana 다음에 3번째

fruits[fruits.startIndex]
fruits[fruits.endIndex - 1] // -> banana 2번째 값


fruits.startIndex == 0
fruits.endIndex - 1 == 2


/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") { //contains : 포함한다 라는 뜻 알파벳 안에 "A" 라는게 포함하고 있니
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

if let index = alphabet.firstIndex(of: "D") {
  print("index of D: \(index)")
}
//if 를 써줌으로 optional 이 나오지 않는다. if가 충족되어야만 실행이 되니까

//let idx1 = alphabet.firstIndex(of: "D")
//print(idx1)

//let idx2 = alphabet.firstIndex(of: "Q")
//print(idx2)


/*:
 ### Add a new Element
 */

//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B") // .append는 추가하는 함수
alphabetArray += ["C"] // 배열을 더하려면 []로 감싸줘야 한다.
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

//alphabetArray.append(5.0) // 다른 타입을 더하려고 하면 에러가 난다.
//alphabetArray + 1 // 타입이 달라서 에러가 난다

alphabetArray.insert("S", at: 0) // insert는 추가 하고 싶은 위치를 정할 수 있다. at: 0은 0번재에 추가가 된다.
alphabetArray.insert("F", at: 3)
alphabetArray

/*:
 ### Change an Existing Element
 */

alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z" // 특정 값을 바꿀 수 있다. 추가 되는 게 아니라 바뀐다.
alphabetArray // ["Z", "A", "B", "C"]의 결과가 아니라 ["z", "B", "C"] 결과가 나온다


1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...] = ["Q", "W", "E", "R"]
alphabetArray

alphabetArray[2...] = ["Q", "W"] // 2번째 부터 ["Q", "W"]값이 들어가고 기존에 있던건 "w" 뒤에 것은 사라진다.
alphabetArray   // 결과?


/*:
 ### Remove an Element
 */
alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0) // 0 번째 배열을 제거하고 제거한 값을 반환하게 된다.
alphabetArray

alphabetArray.removeAll() // 전체를 지워준다.


// index 찾아 지우기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") { // C를 찾기 위해 0번째 배열부터 확인한다. 2번째에 "C"있으므로 indexC의 값은 2다.
  alphabetArray.remove(at: indexC)
}
alphabetArray


/*:
 ### Sorting
 */

alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()

alphabetArray.sort()
alphabetArray

// shuffle vs shuffled
// sorted vs sort

//func sorted() -> [Element]
//mutating func sort()

alphabetArray.shuffle()

var sortedArray = alphabetArray.sorted() //ed가 붙여지면 alphabetArray가 변하는게 아니라 alphabetArray을 가진 sortedArray가 변한다. ed가 붙은 거는 반환값이 바뀌고 ed가 붙지 않은 건 자기 자신이 바뀐다.
sortedArray
alphabetArray



// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )
sortedArray


/*:
 ### Enumerating an Array
 */
print("\n---------- [ Enumerating an Array ] ----------\n")

// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value) { // of라는 값이 배열 안에서 처음으로 나타난 인덱스를 반환하는 것
    print("\(index) - \(value)")
  }
}


for tuple in array.enumerated() {
  print("\(tuple.0) - \(tuple.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {
  print("\(index) - \(element)")
}


for (index, element) in array.reversed().enumerated() {
  print("\(index) - \(element)")
}


/*:
 ---
 ### Question
 ---
 */
/*
 - ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
 - 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 - 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
 */

// 2번 문제
// ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]

// 3번 문제
// ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59

var puppy2 = ["p", "u", "p", "p", "y"]
if let index = puppy2.lastIndex(of: "p") {
    puppy2.remove(at: index)
}


var Q1 = [1, 2, 4, 8, 9, 12, 13]
var Q2 = [2, 5, 6, 9, 13]





/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ Answer ] ----------\n")

/*
 ["p", "u", "p", "p", "y"] 라는 배열에서 마지막 "p" 문자 하나만 삭제하기
 */

var puppy = ["p", "u", "p", "p", "y"]
if let lastIndexOfP = puppy.lastIndex(of: "p") {
  puppy.remove(at: lastIndexOfP)
}
puppy


/*
 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
 */

let firstArray = [1, 2, 4, 8, 9, 12, 13]
let secondArray = [2, 5, 6, 9, 13]

var result: [Int] = []
for i in firstArray {
  for j in secondArray {
    if i == j {
      result.append(j)
    }
  }
}

result



/*
 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
 ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
 */

// 1) Swift 에서 제공하는 기본 함수인 max() 를 이용하는 방법
let arr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
arr.max()


// 2) 두 수 중 높은 값을 반환하는 max 를 이용하거나, 3항 연산자를 이용하는 방법
func maximumValue(in list: [Int]) -> Int {
  var maxValue = Int.min
  for number in list {
    maxValue = max(maxValue, number)
    
    // 위 함수는 다음의 3항 연산자와 동일
    // maxValue = maxValue < number ? number : maxValue
  }
  return maxValue
}

maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])



//: [Next](@next)
