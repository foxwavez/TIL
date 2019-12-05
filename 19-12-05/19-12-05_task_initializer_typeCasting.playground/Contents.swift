
func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}

let task1: Any = addTwoValues(a: 2, b: 3)
//[ 과제 ] 1. 위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
//task1 + task1

if let sum = task1 as? Int {
    sum + sum
}

func sum2() -> Int {
    guard let sum2 = task1 as? Int else {
        return 0
    }
    return sum2 + sum2
}
sum2()




// [ 도전 과제 ]
// 1. 과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
// 두 변수의 더하기 연산이 제대로 동작하도록 할 것
// (addTwoValues의 각 파라미터에는 원하는 값 입력)
// task2 + task2


let task2: Any = addTwoValues

if let sum4 = task2 as? Int {
    sum4 + sum4
}


func sum3(a: Int, b: Int) -> Int {
    guard let sum3 = task2 as? Int else {
        return 0
    }
    return sum3 + sum3
}
sum3(a: 4, b: 5)



let a = { (str: String) -> Int in str.count }

class Car {}
let values: [Any] = [
    0,
    0.0,
    (2.0, Double.pi),
    Car(),
    { (str: String) -> Int in str.count }
]
// [ 도전 과제 ]
// 2. 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

values[1] as! Double

for value in values {
    switch value {
    case is Int:
        let b = values[0] as! Int
        print("\(b)")
    case is Double:
        print("\(values[1] as! Double)")
    case is (Double, Double):
        print("\(values[2] as! (Double, Double))")
    case is Car:
        print("\(values[3] as! Car)")
    case is (String) -> Int:
        print("\(values[4] as! (String) -> Int)")
    default:
        print("values 배열에 있는 아이템이 아닙니다.")
    }
}

//Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
//- Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
//- Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가



class Vehicle {
  let name: String
  let maxSpeed: Int
    
    init() {
        name = "탈 것"
        maxSpeed = 100
    }
}

class Automobile: Vehicle {
  var modelYear: Int
  var numberOfSeats: Int
    init?(modelYear: Int, numberOfSeats: Int) {
        guard modelYear <= 0 || numberOfSeats <= 0 else { return nil }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
    }
}
class Bus: Vehicle {
  let isDoubleDecker: Bool
  let maxSpeed: Int
    init() {
        isDoubleDecker = true
    }
}


