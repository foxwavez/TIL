//: [Previous](@previous)
import UIKit
/*:
 ---
 # Comparing Structures and Classes
 ---
 */

/*
 [ 클래스와 구조체 공통점 ]
 - 값을 저장하기 위한 프로퍼티
 - 기능을 제공하기 위한 메서드
 - 초기 상태를 설정하기 위한 생성자
 - 기본 구현에서 기능을 추가하기 위한 확장(Extension)
 - 특정 값에 접근할 수 있는 첨자(Subscript)
 - 특정한 기능을 수행하기 위한 프로토콜 채택
 - Upper Camel Case 사용
 */


class SomeClass {
  var someProperty = 1
  func someMethod() {}
}
struct SomeStruct {
  var someProperty = 1
  func someMethod() {}
}

let someClass = SomeClass()
let someStruct = SomeStruct()



/*
 [ 클래스만 제공하는 기능 ]
 - 상속 (Inheritance)
 - 소멸자 (Deinitializer)
 - 참조 카운트 (Reference counting)
 */


// 상속
struct ParentS {}
//struct Child: Parent {}   // 오류


// 소멸자
struct Deinit {
//  deinit { }    // 오류
}

// 참조 카운트(Reference Counting)  X




/*:
 ---
 #### 값 타입 vs 참조 타입
 ---
 */
class Dog {
  var name = "토리"
}
struct Cat {
  var name = "릴리"
}

let dog = Dog() // 0x1234 -> Dog()
let cat = Cat() // Cat() name = "릴리"

//dog.name = "릴리" // 클래스는 상수로 생성해도 안에 프로퍼티를 수정할 수 있다.
//cat.name = "토리" // 구조체를 상수로 생성해서 안에 값을 바꿀 수 없어 에러가 난다





let dog1 = dog
var cat1 = cat // var 로 선언하면 프로퍼티를 수정할 수 있다
dog1.name = "뽀삐"
cat1.name = "뽀삐"
dog.name
cat.name


//dog === dog1
//cat === cat1



/*:
 ---
 #### 생성자 비교
 ---
 */
/*
 var로 선언된 변수
 */

class UserClass1 {
  var name = "홍길동"
}
struct UserStruct1 {
  var name = "홍길동"
}

let userC1 = UserClass1()
let userS1_1 = UserStruct1()
let userS1_2 = UserStruct1(name: "깃봇") //struck은 init을 안해줘도 안에 프로퍼티를 바꿔줄 수 있다 -> init을 자동 생성한다
userS1_1.name
userS1_2.name



/*
 프로퍼티에 초기화 값이 없을 때
 */

class UserClass2 {
  var name: String
  // 초기화 메서드 없으면 오류
  init(name: String) { self.name = name } // 지정 생성자
}

struct UserStruct2 {
  var name: String
  var age: Int
  
  // 초기화 메서드 자동 생성
  // 단, 생성자를 별도로 구현했을 경우 자동 생성하지 않음
//  init(name: String) {
//    self.name = name
//    self.age = 10
//  }
}

let userC2 = UserClass2(name: "홍길동")
let userS2 = UserStruct2(name: "홍길동", age: 10)



/*
 저장 프로퍼티 중 일부에만 초기화 값이 있을 때
 */

class UserClass3 {
  let name: String = "홍길동"
  // 저장 프로퍼티 중 하나라도 초기화 값이 없는 경우 생성자를 구현해야 함
//  let age: Int
}

struct UserStruct3 {
  let name: String = "홍길동"
  let age: Int  // 초기화를 해주지 않아도 에러가 나지 않는다.
}
// 초기화 값이 없는 저장 프로퍼티에 대해서만 생성자로 전달
let userS3 = UserStruct3(age: 10)
UserStruct3(age: 20)




/*
 지정(Designated) 생성자, 편의(Convenience) 생성자
 */
class UserClass4 {
  let name: String
  let age: Int
  init(name: String, age: Int) { // 지정 생성자
    self.name = name
    self.age = age
  }
  convenience init(age: Int) { // 편의 생성자
    self.init(name: "홍길동", age: age)
  }
}

struct UserStruct4 {
  let name: String
  let age: Int
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  // Convenience 키워드 사용 X, 지정과 편의 생성자 별도 구분 없음
//  convenience init(age: Int) { // -> 오히려 에러가 난다. 그냥 쓰면 된다
  init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// 따라서 extension에서도 생성자 추가 가능
extension UserStruct4 {
  init(name: String) {
    self.name = name
    self.age = 10
  }
}

let userS4_1 = UserStruct4(name: "홍길동")
let userS4_2 = UserStruct4(age: 20)





/*:
---
#### 프로퍼티 변경
---
*/

struct PointStruct {
  var x = 0
  
//  func updateX() { // 에러가 난다 mutating func updateX()를 해야한다. Stuck,enum 안에서 함수로 값을 바꿔줄 때에는 mutating을 추가
//    self.x = 5
//  }

//  var updateProperty: Int {
//    get { x }
//    set { x = newValue }    // 연산 프로퍼티의 setter는 기본적으로 mutating
//  }
}


//let p2 = PointStruct()
//var p2 = PointStruct()
//p2.updateX()
//p2.updateProperty = 3
//p2.updateProperty




class PointClass {
  var x = 0
  
//  mutating -> 값타입에서만 사용하면 된다.(struck, enum) class는 참조 타입
  func updateX() {
    self.x = 5
  }
}

let p1 = PointClass()
p1.updateX()




/*:
 ---
 #### 프로토콜 적용
 ---
 */


// mutating

protocol Mutate {
//  func update()
  mutating func mutatingUpdate() // 프로토콜 안에서 func로 strct 프로퍼티 값을 바꿔줄 때에는 func 앞에 mutating을 추가 해야 한다.
} // func의 이름이 updat라고 동일하더라도 mutating을 붙인 func와 아닌 것이 따로 구분되게 된다.
struct PointStruct1: Mutate {
    mutating func mutatingUpdate() {
        _ = 0
    }
    
  var x = 0
  
  mutating func update() {
    self.x = 5
  }
}







/*
** 애플 권장사항 **
- 구조체를 기본으로 사용
- 클래스를 사용해야 할 때
  > Objective-C와 호환성이 필요할 때
  > equality(동등성) 외에 identity(정체성, 동일성)를 제어해야 할 때
  > RC(Reference Counting)와 소멸자(deinitialization)가 필요할 때
  > 값이 중앙에서 관리되고 공유되어야 할 때
*/



//: [Next](@next)
