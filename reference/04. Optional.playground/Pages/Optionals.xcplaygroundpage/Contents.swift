//: [Previous](@previous)
/*:
 # Optionals
 */
/*:
 ---
 ### Question
 - 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless)
 ---
 */

// 값이 0 인것은 0이라는 데이터가 있는 상태
// nil은 데이터 자체가 없는 상태













/*:
 ---
 ## Optional
 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * Objective-C 에는 없는 개념
 * 옵셔널 타입은 2가지 가능성을 지님
   - 값을 전혀 가지고 있지 않음
   - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
 ---
 */


let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)

//type(of: Int("123")) // Optional
//type(of: Int(3.14)) // Int
//type(of: Int(3)) // Int




/*
 Optional Type Declaration
 
 var <#variable name#>: <#Type?#>
 var <#variable name#>: <#Optional<Type>#>
 */

var optionalType1: String? //이 형식을 가장 많이 쓰는 편이다
//var optionalType2: Optional<Int>

type(of: optionalType1)
//optionalType2


// Valueless state - nil

var optionalIntInit = Optional<Int>(0)
var optionalInt: Int? = 0
type(of: optionalInt)

optionalInt = nil
optionalInt

let nonOptional3: Int = 0 // 정수
var optionalInt4: Int? = 0 // 정수 or nil


// Optional <-> NonOptional

//var nonOptional1 = nil // nil은 타입추론을 할 수 없어서 에러가 난다. String의 nil인지 Int의 nil인지 알수가 없다
//var nonOptional2: Int = nil
//var nonOptionalType: Int = optionalInt


optionalInt = 10
optionalInt = 100
print(optionalInt)


// Optional -> NonOptional (X) = 옵셔널은 nil값과 다른 타입을 가질 수 있다 / 논옵셔널은 인트 타입만 가질 수 있기 때문
// Optional <- NonOptional (O) => 옵셔널에 논옵셔널은 선언해 값을 넣어줄 수 있지만 / 논옵셔널에 옵셔널을 넣어 선언 할 수 없다

/*:
 ---
 ### Question
 - Optional 헤더 살펴보기
 ---
 */


/*:
 ---
 ## Optional Biding and Forced Unwrapping
 ---
 */

if convertedNumber != nil {
  print("convertedNumber contains some integer value.")
  //  print("convertedNumber has an integer value of \(convertedNumber).")
}

/*:
 ---
 ### Optional Binding
 ---
 */
print("\n---------- [ Optional Binding ] ----------\n")
/*
 if let <#nonOptional#> = <#OptionalExpression#> {
   //nil이 아닐 때 여기 있는 것을 실행 해라
 }
 while let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 guard let <#nonOptional#> = <#OptionalExpression#> else {
   <#Code#>
 }
 */  //Optional을 없앨 때 방법


let nilValue: String? = nil
let someValue = "100"

if let number = Int(someValue) {
  print("\"\(someValue)\" has an integer value of \(number)")
} else {
  print("Could not be converted to an integer")
}



// Optional Binding - let vs var

var optionalStr: String? = "Hello, Optional"

// let
if let optionalStr = optionalStr {
//  optionalStr += "😍" //if let은 옵셔널 바이딩이 되지만 밸류값을 바꿀 수 는 없다
  optionalStr
} else {
  "valueless string"
}

// var
if var str = optionalStr { //if var는 밸류값을 바꾸면서(이모지 추가) 옵셔널 바인딩이 가능하다
  str += "😍"
  str
}

// 옵셔널은 값이 Int 나 nil 바뀔 여지가 있으므로 var 로 선언


// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),
  let secondNumber = Int("42"),
  firstNumber < secondNumber,
  secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}

// 위와 동일한 동작
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber, secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


/*:
 ---
 ### Forced Unwrapping
 ---
 */
/*
 let nonOptional = <#OptionalExpression!#>
 */

// 옵셔널 값에 !붙여주면 옵셔널 바인딩(옵셔널을 없앨 수 있다)이 된다

print("\n---------- [ Forced Unwrapping ] ----------\n")

if convertedNumber != nil { //nil이 아닐 때 실행해라
//  print("convertedNumber has an integer value of \(convertedNumber).")
  print("convertedNumber has an integer value of \(convertedNumber!).")
}

print(convertedNumber)
print(convertedNumber!)


// Forced unwrap of nil value

convertedNumber = nil
convertedNumber
//convertedNumber!


/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */

let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


var assumedString: String! = "An implicitly unwrapped optional string."//타입 자체에 !느낌표를 붙여주는게 IUO 기법
type(of: assumedString) //타입에 ! 붙이게 되면 반드시 값이 있다는 뜻을 가지고 있다.
type(of: possibleString)

let implicitString: String = assumedString
let stillOptionalString = assumedString
type(of: assumedString)
type(of: implicitString)
type(of: stillOptionalString)

print(assumedString)
print(assumedString!)

//assumedString = nil
//print(assumedString!)


/*
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 - 프로퍼티 지연 초기화에 많이 사용
 */


/*:
 ## Nil-coalescing Operator
 */

print("\n---------- [ Nil-coalescing ] ----------\n")

optionalStr = nil

var result = ""
if optionalStr != nil { // nil이 아니라면
   result = optionalStr! // result는 nil이 아니다
} else {
   result = "This is a nil value"
}
print(optionalStr)
print(result)


let anotherExpression = optionalStr ?? "This is a nil value" // ?? -> 옵셔널을 제거 할 수 있다
print(optionalStr)
print(anotherExpression)


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1 // optional을 제거 하기 위해 ?? 물음표 2개를 붙인다
print(anotherExpression2)


// 어디에 쓰일 수 있을까요?
// Example

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName // nil일 때 사용할 기본값 정해준다
print(colorNameToUse)

/*:
 ---
 ### Question
 - isTrue ? a : b   와의 차이
 - optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
 ---
 */

let anotherExpression1 = optionalStr ?? "This is a nil value"

// optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
// 내가 적은 답
//if anotherExpression == Optional {
//    print("This is a nil valued")
//}

print(optionalStr)
print(anotherExpression1)

/*:
 ## Optional Chaining
 */

print("\n---------- [ Optional Chaining ] ----------\n")

let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

print(greeting["John"]) // 딕셔너리에서는 키가 있을 수 있고 없을 수도 있어 타입이 옵셔널이 된다.
print(greeting["John"]?.count)
print(greeting["NoName"])

// Optional Chaining
print(greeting["John"]?.lowercased().uppercased())
print(greeting["Alice"]?.lowercased().uppercased())

// Optional Binding -> 옵셔널을 제거 해주는 방법
if let greetingValue = greeting["John"] {
  print(greetingValue.lowercased().uppercased())
}

/*:
 ---
 ### Question
 - 아래 두 종류 옵셔널의 차이점이 무엇일까요?
 ---
 */

print("\n---------- [ ] ----------\n")

var optionalArr1: [Int]? = [1,2,3] // Array가 있을 수도 없을 수도 있다
var optionalArr2: [Int?] = [1,2,3] // Array 안에 요소들이 옵셔널로 들어올 수 있다


var arr1: [Int]? = [1,2,3]
//arr1.append(nil) -> 에러가 난다 왜냐면 배열 자체가 nil 없는 상태이기 때문 []-> 이게 nil
//arr1 = nil // 배열 자체를 nil로 주는 것은 가능하다

//print(arr1?.count)
//print(arr1?[1])


var arr2: [Int?] = [1,2,3]
//arr2.append(nil) // 에러가 나지 않는다. 배열 안의 요소가 nil로 들어올 수 있는 것이기 때문 [1, 2, 3, nil]
//arr2 = nil

//print(arr2.count)
//print(arr2[1])
//print(arr2.last)

// 배열 안에 있는 값을 호출할 때 옵션을 눌러 타입을 확인해보면 ? 옵셔널로 값이 뜨는 이유는 배열 안에 값이 있을 수도 없을 수도 있기 때문
/*:
 ---
 ## Optional Function Types
 ---
 */
print("\n---------- [ Optional Function ] ----------\n")


func sum(a: Int, b: Int) -> Int {
    return a + b
}
var sumFuntion: ((Int, Int) -> Int)? = sum(a:b:)

sum (a: 1, b: 2)

print (sumFuntion!(1, 2))

//sumFuntion = nilValue
sumFuntion? (1, 2)



var aClosure: (() -> Int?)? = {
  return 10
}

type(of: aClosure)
print(aClosure)
print(aClosure?())

aClosure?()
aClosure!()

aClosure = nil
aClosure?()
//aClosure!()



/*:
 ---
 ### Question
 - 아래 내용 참고하여 함수 정의
 ---
 */
/*
 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
 func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
 */

func calculateModulo(a: Int, b: Int?) -> Int? {
    if b == 0 || b == nil {
        return nil
    }
    else {
        return a % b!
    }
}
calculateModulo(a: 1, b: 3)




/*:
 ---
 ### Answer
 ---
 */
// OptionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
let answer = optionalStr != nil ? optionalStr! : "This is a nil value"




// 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수
func calculateModulo(op1: Int, op2: Int?) -> Int? {
  guard let op2 = op2, op2 != 0 else { return nil }
  return op1 % op2
}

calculateModulo(op1: 10, op2: 4)
calculateModulo(op1: 39, op2: 5)



//: [Next](@next)
