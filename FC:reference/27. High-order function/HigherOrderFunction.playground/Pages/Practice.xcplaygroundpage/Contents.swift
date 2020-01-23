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

// 1번
func sumDogAge(pets: [Pet]) -> Int {
  return 0
}
sumDogAge(pets: myPet)

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
  return []
}
oneYearOlder(of: myPet)



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")






//: [Next](@next)
