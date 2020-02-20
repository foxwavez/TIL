import UIKit


let numberSymbol: Character = "三" //중국어로 3을 의미라는 문자입니다.
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
  possibleIntegerValue = 1
case "2", "٢", "二", "๒":
  possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    break
  possibleIntegerValue = 3
case "4", "٤", "四", "๔":
  possibleIntegerValue = 4
default:
  break
}
if let integerValue = possibleIntegerValue {
  print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
  print("An integer value could not be found for \(numberSymbol)")
}


func minMax(array: [Int]) -> (min: Int, max: Int)? {
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }

  return (currentMin, currentMax)
}
if let bounds = minMax(array: [1, 2, 89, 109, 17, 78]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}


func someFunction(firstParameterName: Int, secondParmaterName: Int) {
  // 함수 내부에서 firstParameterName과 secondParameterName의 인자를 사용합니다.
}
someFunction(firstParameterName: 1, secondParmaterName: 2)


func greet(to person: String, from hometown: String) -> String {
  return "Hello \(person)! Glad you clould visit from \(hometown)."
}
print(greet(to: "Doe", from: "Sanfransisco"))
// Print "Hello Bill! Glad you could visit from Cupertino"


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and another is now \(anotherInt)")


