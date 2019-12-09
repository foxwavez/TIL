//: [Previous](@previous)
/*:
 ---
 # Scope
   - 스코프 범위에 의한 할당 및 해제
 ---
 */


class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
  var prop = ClassProperty() // count 1
  
  func allocateInstance() {
    let local = LocalScope()
    local.doSomething() // local 변수는 함수 안에서만 살아있다.
  }
  
  deinit {
    print("Application is being deinitialized")
  }
}


// Q. 아래의 코드 실행 시 출력되는 메시지는?

var app: Application? = Application() // count 1 -> ClassProperty Conunt 1
app?.prop.doSomething()
app?.allocateInstance()



// Q. ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요?
app = nil // app -> 0x1234 Aplication count 0 -> 



//: [Next](@next)
