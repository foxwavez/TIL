//: [Previous](@previous)
/*:
 ---
 ## forEach
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태
 ---
 */
print("\n---------- [ forEach ] ----------\n")

let immutableArray = [1, 2, 3, 4]

for num in immutableArray {
  print(num, terminator: " ")
}
print()


immutableArray.forEach { num in
  print(num, terminator: " ")
}
print()


immutableArray.forEach {
  print($0, terminator: " ")
}
print()


func printParam(_ num: Int) {
  print(num, terminator: " ")
}
immutableArray.forEach(printParam(_:))
print()


/*:
 ---
 ### Question
 - forEach 와 for 문의 차이점은?
 - 1~10 까지의 숫자 중 짝수만 출력하다가 9가 되면 종료되도록 forEach를 이용해 구현해본 뒤 for 와 비교하여 설명
 ---
 */
// forEach 와 for 문의 차이점
// -> forEach는 함수이고 for문은 반복문이다.

for num in immutableArray {
  print(num, terminator: " ")
    // for 문 안에서는 return을 사용할 수 없다
    // return은 함수 안에서만 사용할 수 있기 때문 -> 반복문에서는 break
}
print()


immutableArray.forEach { num in // 함수를 for문의 개수 만큼 실행하는 것이 forEach
  print(num, terminator: " ")
    return // 그래서 return이 있어도 중간에 멈추지 않고 아래의 print를 실행한다.
    // 마치 for문 안에 있는 함수와 동일하게 실행이 된다
    // forEach는 함수 기 때문에 return을 사용할 수 있다
}
print()


// 1~10 까지의 숫자 중 짝수만 출력하다가 9가 되면 종료되도록 forEach를 이용해 구현해본 뒤 for 와 비교하여 설명
let numbersArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbersArr.forEach { num in
    if num >= 9 {
        return // forEach는 함수라서 return을 이용해 종료시킴 -> 실제로는 1~10 까지 실행이 되지만 return 하는 것
    } else if num.isMultiple(of: 2){
        print(num, terminator: " ")
    }
}
print()

for num in 1...10 {
    if num >= 9 {
        break // for문은 반복문이라 break를 이용해 종료시킴 -> 실제로 1~9 까지 실행되고 멈춘다
    } else if num.isMultiple(of: 2) {
        print(num, terminator: " ")
    }
}
print()


/*:
 ---
 ## map
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
 ---
 */

print("\n---------- [ Map ] ----------\n")

let names = ["Chris", "Alex", "Bob", "Barry"]
names
  .map { $0 + "'s name" }
  .forEach { print($0) }

let intArr = Array<Int>(repeating: 2, count: 10) // 2가 10번 나오는 배열
//for (idx, value) in intArr.enumerated() {
//  idx + value
//}



// for 문 비교
var numArr = [Int]()
for (idx, value) in intArr.enumerated() {
  numArr.append(idx + value)
}
print(numArr)

// map
let indexPlusElement = intArr.enumerated().map {
// map은 컬렉션 안에 연산을 하고 그 데이터를 어떠한 변수(ex. indexPlusElement) 안에 저장해줘야 한다. 안 그럼 워닝
  return $0 + $1
    // $0은 idx, $1은 value
}
print(indexPlusElement)


// 클로저 안에서 타입이 명시가 안되고 그냥 사용 ($0, $1) 이런 형태 -> 잘 안되는 경우도 있다(컴파일러의 한계) 예를 들어 print를 찍어야 한다던가
// 그럴 땐 클로저 안에 매개변수의 타입을 명확하게 작성하면 된다
 
//let indexPlusElement = intArr.enumerated().map { (arg: ((Int, Int))) -> Int in
//  print($0, $1)
//}
//print(indexPlusElement)

// 함수를 클로저로 변환하면서 점점 줄이는 과정에 대한 익숙함이 생겨야 위와 같은 상황을 마주하더라도 잘 극복할 수 있다
// 클로저 변화과정을 더 유심히 공부할 것


/*:
 ---
 ## filter
 - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
 ---
 */
print("\n---------- [ filter ] ----------\n")

// let names = ["Chris", "Alex", "Bob", "Barry"]

let containBNames = names
  .filter { (name) -> Bool in
    return name.contains("B")
  }
print(containBNames)

names.filter { $0.contains("B") }


var names2 = ["Alex", "Alex", "Alex", "Alex"]
// Filter를 사용하지 않고 for문을 사용할 때 아래 코드
var count = 0
for name in names2 {
    if name == "Alex" {
        count = count + 1
    }
}
print(count)

// .filter와 .count 함수를 사용하니까 훨씬 코드가 줄어든다
let countAlexNames = names2
  .filter { $0 == "Alex" } // Alex 인 element를 찾고
  .count //Alex가 몇 개인지 확인
print(countAlexNames)


/*:
 ---
 ## reduce
 - 컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환.   e.g. Int, String 타입
 ---
 */
print("\n---------- [ reduce ] ----------\n")

/*
 (1...100)
   .reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)
 
 Result Type - 결과로 얻고자하는 값의 타입
 
 initialResult - 초기값
 nextPartialResult - (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)
 */

let sum1to100 = (1...100).reduce(0) { (sum: Int, next: Int) in
  return sum + next
}
print(sum1to100)
// 0 + 1 = 1
// 1 + 2 = 3
// 3 + 3 = 6
// 6 + 4 = 10
// ....


//sum1to100 코드를 for문으로 구현했을 때
var sum = 0
for i in 1...100 {
    sum = sum + i
}
print(sum)


(1...100).reduce(0) { (sum: Int, next: Int) -> Int in
    return sum - next // 0 - 1 = -1,  -1 -2 = -3
}
//  sum1to100 코드를 줄인 형태
print((1...100).reduce(0) { $0 + $1 })
print((1...100).reduce(0, +))

//직접 더하는 형태 X     return 값이 sum이 되는 것이다
//(1...100).reduce(0) { (sum, next) in
//  sum += next
//}

["123", "456"].reduce(100) { (initialResult: Int, value: String) in
    return initialResult + Int(value)! // 100 + 123, 223 + 456 = 679
}

["123", "456"].reduce(100) {
    $0 + Int($1)! // 100 + 123, 223 + 456 = 679
}


/*:
 ---
 ### Question
 - 문자열 배열을 reduce를 이용해 하나의 문자열로 합치기
 - 숫자 배열을 reduce를 이용해 하나의 문자열로 합치기
 ---
 */
// 아래 둘 모두 reduce를 이용해 "123" 이라는 문자열이 되도록 만들기
["1", "2", "3"]

["1", "2", "3"].reduce("") { (result: String, value: String) -> String in
    return result + value
}


[1, 2, 3]
[1, 2, 3].reduce("") { (result, value) -> String in
    return result + String(value)
}


/*:
 ---
 ## compactMap
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여 변형된 새 컬렉션 반환
 - 옵셔널 제거
 ---
 */
print("\n---------- [ compactMap ] ----------\n")

let optionalStringArr = ["A", nil, "B", nil, "C"]
print(optionalStringArr)// "[Optional("A"), nil, Optional("B"), nil, Optional("C")]"
print(optionalStringArr.compactMap { $0 }) // ["A", "B", "C"]
// compactMap을 사용해서 옵셔널을 제거


let numbers = [-2, -1, 0, 1, 2]
let positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil } // 0보다 크면 $0을 반환 아니면 nil 반환
print(positiveNumbers) // 0보다 작은 -2, -1은 nil로 반환되고 compactMap 때문에 nil이 된 -2, -1이 제거 됨

// .map이라서 옵셔널이 제거되지 않아 nil 값이 그대로 나옴
print(numbers.map { $0 >= 0 ? $0 : nil })

/*:
 ---
 ## flatMap
 - 중첩된 컬렉션을 하나의 컬렉션으로 병합
 ---
 */
print("\n---------- [ flatMap ] ----------\n")

let nestedArr: [[Int]] = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
print(nestedArr)
print(nestedArr.flatMap { $0 }) // [1, 2, 3, 9, 8, 7, -1, 0, 1] 로 변한다.


let nestedArr2: [[[Int]]] = [[[1, 2], [3, 4], [5, 6]], [[7, 8], [9, 10]]] // 3중 배열
let flattenNumbers1 = nestedArr2.flatMap { $0 } // [[1, 2], [3, 4], [5, 6]], [[7, 8], [9, 10]] // 2중 배열
print(flattenNumbers1)

let flattenNumbers2 = flattenNumbers1.flatMap { $0 } // 1중 배열로 변환
print(flattenNumbers2)

let x = nestedArr2
  .flatMap { $0 + [[5]]} // flatMap {} 안에서 연산을 해줄 수 있다
x

    let y = nestedArr2
y
  .flatMap { $0 }
  .flatMap { $0 }
// 연속적으로 메소드 체이닝이 가능하다




/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ A. for vs forEach ] ----------\n")

/*
 for문은 반복문이므로 break, continue 키워드 사용
 forEach문은 함수(클로져)이므로 break, continue 대신 return 키워드 사용
 */

for i in 1...10 {
  guard i != 9 else { break }
  guard i % 2 == 0 else { continue }
  print(i, terminator: " ")
}
print()

(1...10).forEach {
  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
print()


print("\n---------- [ A. reduce ] ----------\n")

let merge1 = ["1", "2", "3"].reduce("") { $0 + $1 }
print(merge1)

let merge2 = [1, 2, 3].reduce("") { $0 + String($1) }
print(merge2)

//위 내용을 Full Syntax 로 표현했을 때
//[1, 2, 3]
//  .reduce("") { (str: String, num: Int) in
//    return str + String(num)
//  }






//: [Next](@next)
