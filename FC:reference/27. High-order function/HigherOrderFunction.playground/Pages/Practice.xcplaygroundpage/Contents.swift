//: [Previous](@previous)
import Foundation

// 키노트 문제 참고
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]

// 1번 강아지 나이만 합산한 결과를 반환하는 함수 구현

func sumDogAge(pets: [Pet]) -> Int {
    var sum = 0
    pets.forEach { (Pet) in
        if Pet.type == .dog {
            sum = sum + Pet.age
        } else {
            sum
        }
    }
    return sum
}
sumDogAge(pets: myPet)

// 2번 모든 Pet이 나이를 1살 씩 더 먹었을 때의 상태를 지닌 새로운 배열을 배열을 반환하는 함수 구현
let names = ["Chris", "Alex", "Bob", "Barry"]
names
  .map { $0 + "'s name" }
  .forEach { print($0) } //

func oneYearOlder(of pets: [Pet]) -> [Pet] {

    var tempPets = [Pet]()
//    for pet in pets {
//        let tempPet = Pet(type: pet.type, age: pet.age + 1)
//        tempPets.append(tempPet)
//    }
    // for문 + 배열, enum 설명 듣고 도움 받아서 작성 한 거
    pets.forEach { (pet) in
        let tempPet = Pet(type: pet.type, age: pet.age + 1)
        tempPets.append(tempPet)
    }
    // 내가 struck, enum 이해를 못해서 숫자만 가져와서 배열로 조합하는 것만 시도해본거
    var plusAgePets = [Int]()
    pets.forEach { (pet) in
        let tempPet = pet.age + 1
        plusAgePets.append(tempPet)
        print(plusAgePets)
    }
    
  return tempPets
}
oneYearOlder(of: myPet)



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")

// 문제
// 배열의 각 인덱스와 해당 인덱스의 요소를 곱한 값 중 홀수는 제외하고 짝수에 대해서만 모든 값을 더하여 결과 출력

// 1. 배열의 각 요소 * index 값을 반환하는 함수
// 2. 짝수 여부를 판별하는 함수
// 3. 두 개의 숫자를 더하여 반환하는 함수
// 위 1~3번에 해당하는 함수를 각각 정의하고 이것들을 함께 조합하여 위 문제의 결과를 도출할 것

let immutableArray = Array(1...40)

func multiplyByIndex(index: Int, number: Int) -> Int {
    return index * number
}

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

func addTwoNumbers(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

// map
//let indexPlusElement = intArr.enumerated().map
// map은 컬렉션 안에 연산을 하고 그 데이터를 어떠한 변수(ex. indexPlusElement) 안에 저장해줘야 한다. 안 그럼 워닝
//  return $0 + $1
    // $0은 idx, $1은 value
//}
//print(indexPlusElement)


let multiplyByIndexNumber = immutableArray.enumerated().map { (offset, element) -> Int in
    return offset * element
}

print(multiplyByIndexNumber)

multiplyByIndexNumber.filter { $0 % 2 == 0 }

let evenNumbers = multiplyByIndexNumber.filter { (number) -> Bool in
    number.isMultiple(of: 2)
}
print(evenNumbers)


let sumNumber = evenNumbers.reduce(0) { (result: Int, evenNumber: Int) -> Int in
    return result + evenNumber
}

print(sumNumber)


let result = immutableArray
    .enumerated()
    .map { (offset, element) -> Int in return offset * element }
    .filter { $0 % 2 == 0 }
    .reduce(0) { (result, evenNumber) -> Int in return result + evenNumber }
print(result)

let result1 = immutableArray
    .enumerated()
    .map { $0 * $1 }
    .filter { $0 % 2 == 0 }
    .reduce(0) { $0 + $1 }
print(result1)

let result2 = immutableArray
    .enumerated()
    .map(multiplyByIndex(index:number:))
//    .map(*)
//    .map { $0 * $1 }
    .filter(isEven(number:))
//    .filter { $0 % 2 == 0 }
    .reduce(0, addTwoNumbers(lhs:rhs:))
//    .reduce(0) { $0 + $1 }
//    .reduce(0, +)
print(result2)


//var temp = 0
//for (index, number) in immutableArray.enumerated() {
//    temp = index * number
//}
//
//print(temp)
//: [Next](@next)
