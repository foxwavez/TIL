//: [Previous](@previous)
/*:
 ---
 # Inheritance
 ---
 */

class Cat { //부모 클래스
  let leg = 4
  func cry() {
    print("miaow")
  }
}

class KoreanShortHair: Cat {} //자식 클래스

let cat = Cat()
print(cat.leg)
cat.cry()

let koshort = KoreanShortHair()
print(koshort.leg)
koshort.cry()

// 자식 클래스는 부모 클래스에 있는 속성과 기능을 다 사용할 수 있다. 부모클래스는 자식 클래스에 있는 속성과 기능을 사용할 수 없다
/*:
 ---
 ### Question
 Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현
 - 상속을 하지 않고 각각 개별적으로 만들면 어떻게 구현해야 하는지 확인
 - 상속을 적용하면 어떻게 바뀌는지 확인
 ---
 */
class Person {
    var name: String = "이름"
    var gender: String = "여성"
    var money: Int = 100000
    let leg: Int = 2
    let nose: Int = 1
    
    func eat() {
        
    }
    func sleep() {
        
    }
}

class Student {
}

class UniversityStudent {
}



/*:
 ## final
 */
print("\n---------- [ Final ] ----------\n")

class Shape {
}

final class Circle: Shape { // 이제 더 이상 상속 받지 못하게 final을 작성하면 된다 
}

//class Oval: Circle {
//}



/*:
 ---
 ### Answer
 ---
 */

class Person1 {
  let name = "홍길동"
  let age = 20
  
  func eat() {
    print("eat")
  }
}


print("\n---------- [ Without Subclassing ] ----------\n")

//class Student1 {
//  let name = "홍길동"
//  let age = 20
//  let grade = "A"
//
//  func eat() {
//    print("eat")
//  }
//  func study() {
//    print("study")
//  }
//}
//
//class UniversityStudent1 {
//  let name = "홍길동"
//  let age = 20
//  let grade = "A"
//  let major = "Computer Science"
//
//  func eat() {
//    print("Eat")
//  }
//  func study() {
//    print("Study")
//  }
//  func goMT() {
//    print("Go membership training")
//  }
//}


print("\n---------- [ Subclassing ] ----------\n")

class Student1: Person1 {
  let grade = "A"
  
  func study() {
    print("study")
  }
}

class UniversityStudent1: Student1 {
  let major = "Computer Science"
  
  func goMT() {
    print("Go membership training")
  }
}



//: [Next](@next)
