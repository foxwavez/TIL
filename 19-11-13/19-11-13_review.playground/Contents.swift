
// 타입을 명시할 때
let strArray1: Array<String> = ["apple", "orange"]
let strArray2: [String] = ["apple", "orange"] // ->  이 형식을 자주 쓴다.

// 타입을 명시하지 않을 때
let strArray3 = ["apple", "orange", "melon"]

// 배열에서 엘리먼트를 더해줄 때
// var alphabetArray: Array<String> = []
// var alphabetArray: [String] = []
// var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B") //.append는 추가하는 함수
alphabetArray = alphabetArray + ["C"]



class ProtocolName {
    var property = 3
}

class SuperClassName: ProtocolName  {
    var property3 = 3
}


class ClassName: SuperClassName {
    // Property List
    var property1 = 1
        let property2 = "2"
    
    // Method List
    func someFunction() {}
}
let object: ClassName = ClassName()
object.property1
object.property2
object.someFunction()

// Class의 저장 프로퍼티 중 초기화되지 않은 값이 하나라도 있다면
// 반드시 init 메서드를 만들어야 한다
class Dog {
    let name: String
    let color: String
    
    // init 메서드는 파라미터가 없다
    init() {
        name = "tory"
        color = "Brown"
    }
    
    // 파라미터를 이용해 객체 생성 시 입력을 받아서 초기화(initialize)할 수 있다
    init(name: String) {
        self.name = name
        color = "Black"
    }
    func sit() {
        print("\(name) Sit")
    }
}

let dog1: Dog = Dog()
let dog2: Dog = Dog(name: "Sake")

dog1.name // name: "tory"
dog2.name // name: "Sake"

class LazyStoredProperty {
    var width = 10.0
    var height = 20.0
    // 1. 외부 요인이나 다른 설정에 기반
        //   var area = self.width * self.height
    lazy var area = width * height
    
    // 2. 계산 비용이 많이 드는 상황
    var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
    
    
    // 3. 필요한 경우가 제한적인 상황
    func ifStatement() {
        if true {
            print(area)
        } else {
            print(width)
        }
    }
}

// LazyStoredProperty()를 통해 클래스 인스턴스를 생성하
// 최초 호출되는 시점에 초기화되기 때문에 의도에 맞게 사용하려면 순서에 주의해야 함
let lazyStored1 = LazyStoredProperty()
lazyStored1.area        // 최초 실행시 width * height로 저장되므로 200으로 초기화
lazyStored1.width = 30
lazyStored1.area        // 이전에 최초 실행 시 저장된 값에 접근하므로 200

let lazyStored2 = LazyStoredProperty()
lazyStored2.width = 30  // lazy 지연저장 프로퍼티므로 호출할 때 width 값을 넣어 초기화되고 실행된다
lazyStored2.area // width의 값이 이미 30이 넣어진 상태로 계산됨
