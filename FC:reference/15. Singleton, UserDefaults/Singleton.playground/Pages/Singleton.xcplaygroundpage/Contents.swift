//: [Previous](@previous)
import UIKit
/*:
 # Singleton
 - 특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴
 - 한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주
 - 어플리케이션에서 유일하게 하나만 필요한 객체에 사용
 - UIApplication, AppDelegate 등
 */

/*
 iOS 싱글톤 사용 예
 */
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default


/*:
 ## Syntax
 */
//: ### Obj-C
//: ![objc_singleton](objc_singleton.png)
/*:
 ### Swift
 */

class NormalClass {
  var x = 0
}

let someObject1 = NormalClass()
someObject1.x = 5

let someObject2 = NormalClass()
someObject2.x = 1

let someObject3 = NormalClass()
someObject3.x = 10

someObject1.x
someObject2.x
someObject3.x



/*
 static 전역 변수로 선언한 것은 지연(lazy) 생성되므로
 처음 Singleton을 생성하기 전까지 메모리에 올라가지 않음
 */

// static var, static let
// 타입 프로퍼티
// 실제로 사용 될 때 만들어져서 메모리에 올라가게 된다.

class SingletonClass {
  static let shared = SingletonClass() // 인스턴스를 만들어서 자기 자신을 클래스 안에 넣어주고 있는 것
  var x = 0
}


let singleton1 = SingletonClass.shared // == let singletin1 = SingletonClass() 와 동일하다. -> 인스턴스 생성
singleton1.x = 10

let singleton2 = SingletonClass.shared // 레퍼런스 타입 생각-> 이미 SigletonClass() 인스턴스를 생성했기 때문에 주소값을 갖는다.
singleton2.x = 2

let someVar1 = NormalClass()
someVar1.x = 10
let someVar2 = someVar1
someVar2.x = 20
// 위에 singleton1,2와 동일하다고 생각하면 된다


singleton1.x   //
singleton2.x   //

SingletonClass.shared.x = 30
// 값을 하나만 바꿔도 공유가 되어 밑에 있는 것들이 모두 30으로 바뀐다.

SingletonClass.shared.x  //
singleton1.x  //
singleton2.x  //



SingletonClass().x = 99 // 변수를 만들어주지 않아서 실행되자 마자 값이 사라진다.
SingletonClass().x   // 0 -> 위에 코드와 관련 없어지고 원래 클래스 안에 x값 0이 실행된다.
singleton1.x  //
singleton2.x  //



/*
 Q.
 항상 하나의 객체만을 사용하는 것을 보장해야 하는 상황에서
 아래와 같은 싱글톤 클래스를 만들었는데, 현재 상태에서 생길 수 있는 문제점은?
 */

class MySingleton {
  static let shared = MySingleton()
  var x = 0
}

let object1 = MySingleton.shared
// 새로운 인스턴스를 계속 만들 수가 있는 문제가 생긴다.
let object10 = MySingleton()
let object11 = MySingleton()
// 이 문제를 해결 하여면 클래스 마이싱글톤에 private init()을 추가하여 생성을 새로 못하게 막는다.
// 그래서 shared 로만 접근할 수 있게 된다.






// 여전히 새로운 객체를 만들고 다른 객체에 접근 가능

let object2 = MySingleton()
object1.x = 10
object2.x = 20

object1.x
object2.x




/*
 외부에서 인스턴스를 직접 생성하지 못하도록 강제해야 할 경우 생성자를 private 으로 선언
 단, 일부러 새로운 것을 만들어서 쓸 수 있는 여지를 주고 싶은 경우는 무관
 */

class PrivateSingleton {
  static let shared = PrivateSingleton()
  private init() {}
  var x = 1
}

//let uniqueSingleton = PrivateSingleton.init()
let uniqueSingleton1 = PrivateSingleton.shared
let uniqueSingleton2 = PrivateSingleton.shared
uniqueSingleton1.x
uniqueSingleton2.x

uniqueSingleton1.x = 20

uniqueSingleton1.x
uniqueSingleton2.x




//: [Next](@next)
