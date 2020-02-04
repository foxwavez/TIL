# Initializer

* Designated Initializer(지정 생성자)
* Convenience Initalizer(편의 생성자)
* Failure Initailizer(실패 가능 생성자)
* Required Initializer(필수 생성자)
* Deinitializer(소멸자)

## Designted Initializer (지정 생성자)

* class의 객체를 사용하기 전에 **모든 저장 프로퍼티가 반드시 초기화** 되어야 함
* 초기화가 필요한 모든 저장 프로퍼티를 **단독으로 초기화 가능한** Initializer. Designted Initializer를 호출하면 모든 프로퍼티가 초기화 된거싱 보장됨