// 연산프로퍼티는 값을 "저장"하기 보다는 연산을 한다
// 값이 연산을 통해 바뀌어야 하기 때문에 var 선언해줘야 한다
// set은 생략 가능, get은 불가능(연산프로퍼티 값 할당, 값 반환 불가)
class Point {
    var tempX : Int = 1
    var x: Int {
        get { // 읽기, 값을 가져오는 기능
            return tempX
        } // 쓰기, 값을 바꾸는 기능
        set(newValue) {
            tempX = newValue * 2
            
//            set(i) { // newValue 대신 (소괄호)를 사용해줄 수 도 있다
//                tempX = i * 2
//            }

        }
    }
}

var p: Point = Point()
p.x = 12
print(p.x)
p.x = 88
print(p.x)
//


// 업데이트 되는 데이터에 쓰는 편
// 프로퍼티 옵저버는 프로퍼티 값의 변화를 관찰하고, 이에 응답

class StepCounter {

    //totalStep는 저장 프로퍼티
    var totalSteps: Int = 0 {
        willSet { //값이 저장되기 직전에 호출됩니다.
            print("totalSteps을 \(newValue)로 설정하려고 합니다")
        }
        didSet { // 새로운 값이 저장된 직후에 호출됩니다.
            if totalSteps > oldValue  {
                print("\(totalSteps - oldValue)걸음이 추가되었습니다.")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 190
stepCounter.totalSteps = 300
// totalSteps에서는 값이 있으면 값이 이미 저장된 후












class Vehicle { // 탈 것
    var currentSpeed = 0.0 // 현재 스피드, 저장 프로퍼티
    var description: String { // 설명 get을 생략한 연산 프로퍼티 // 읽기 전용 프로퍼티
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing
    }
}


let someVehicle = Vehicle() // Vehicle 타입의 인스턴스
print("Vehicle: \(someVehicle.description)")
// 이제 부터 Vehicle의 프로퍼티, 메소드에 접근 가능

class Car: Vehicle {
    
    var gear = 1
    var returnStr = ""
                            // 수퍼 클래스와 동일하게 타입 적용해야 한다
    override var description: String { // Vehicle description 재정의 오버라이드
            
        get{
        return super.description + " in gear \(gear)"
        }      // super로 상위클래스 프로퍼티 접근하면
        set{
            returnStr = newValue // set 프로퍼티에 딱히 값을 넣어주지 않을 때는 newValue라고 적는다
        }
        
        
        
//         override var currentSpeed: Double = 2.0 -> 에러
        // 상위 클래스의저장 프로퍼티는 하위클래스에 또 저장프로퍼티로 override(재정의) 불가
        // 상위 클래스에서 저장 프로퍼티, 하위클래스에서 get set 가능해서 오버라이드는 가능하다
        // 상위 클래스 읽기만 (get)만 있는 경우에 하위클래스 set을 사용 불가하다
    }
    override var currentSpeed: Double {
        get{
            return 1.0
        }
        set{
        gear = Int(super.currentSpeed)
            }
       }
}

let car = Car()
let vehicle = Vehicle()
print("Car: \(car.description)") // 프로퍼티에 접근하여 값 넣어주지 않음, 기본값이 적용
// Car: traveling at 0.0 miles per hour in gear 1
car.currentSpeed = 25.0
car.gear = 3
// Car클래스의 인스턴스를 만들어서 description에 접근하면
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet { // didset을 쓰려면 상위클래스에 연산 프로퍼티가 Set까지 있어야 한다.
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}


let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4


