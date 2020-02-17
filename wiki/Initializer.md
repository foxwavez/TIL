# Initializer

* Designated Initializer(지정 생성자)
* Convenience Initalizer(편의 생성자)
* Failure Initailizer(실패 가능 생성자)
* Required Initializer(필수 생성자)
* Deinitializer(소멸자)

## Designted Initializer (지정 생성자)

* class의 객체를 사용하기 전에 **모든 저장 프로퍼티가 반드시 초기화** 되어야 함

* 초기화가 필요한 모든 저장 프로퍼티를 **단독으로 초기화 가능한** Initializer. Designted Initializer를 호출하면 모든 프로퍼티가 초기화 된거싱 보장됨

* Class에 반드시 하나 이상 존재함 `init()` 을 따로 만들지 않아도 기본 생상자가 생성됨. 아무 동작도 안하니까 생략된 것

* Designated Initializer 안에서 또 다른 DI를 호출할 수 없음

  ```swift
  class Rectangle {
    var width: Int 
    var height: Int
    var posX: Int
    var posY: Int
    
    init() {
      self.width = 20
      self.height = 20
      self.posX = 0
      self.posY = 0
    }
  }
  ```

  