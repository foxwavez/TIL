//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person() // count 1
var tory: Dog? = Dog() // count 1

giftbot?.pet = tory // dog count 2
tory?.owner = giftbot // person count 2

giftbot?.doSomething() // person count 1
tory?.doSomething() //dog count 1


/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */

/*:
 ---
 ### Answer
 ---
 */
// 순서 주의
// 순서를 주의해야 하는 이유
// 클래스 giftbot, tory 먼저 nil 값을 주게 되면 클래스 안에 프로퍼티 pet, owner에 접근할 방법이 있어서 (메모리 상에서 남아있기만 한다)
// 클래스 안에 프로퍼티에 접근할 수 있는 stack의 주소를 잃어버리게 된다. heap에서 값에 대한 데이터는 남아 있다.

giftbot?.pet = nil
tory?.owner = nil

giftbot = nil
tory = nil




//: [Next](@next)
