/*1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송
 
 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지
 */
class Dog {
  let name = "Akong"
  let age = 3
  let weight = 5
  let breed = "poodle"
    
  func howl() {
    print("짖기")
  }
  func eat() {
    print("먹기")
  }
}

let dog = Dog()
dog.howl()
dog.eat()



class Student {
  let name = "이학생"
  let age = 17
  let schoolName = "미림여자정보과학고등학교"
  let grade = 2
    
  
  func study() {
    print("공부하기")
  }
  func eat() {
    print("먹기")
  }
  func sleep() {
    print("잠자기")
  }
}

let student = Student()
student.study()
student.eat()
student.sleep()



class Iphone {
  let name = "사막여우의 아이폰"
  let price = 2000000
  let faceID = true
  
  func call() {
    print("전화 걸기")
  }
  func sendMessage() {
    print("문자 전송")
  }
}

let iphone = Iphone()
iphone.call()
iphone.sendMessage()



class Coffee {
  let name = "싱글 오리진 인도네시아 만델링"
  let price = 50000
  let contruy = "인도네시아 만델링"
  
let coffee = Coffee()
}

/*
2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
 ex)
 let calculator = Calculator() // 객체생성
 
 calculator.value  // 0 ->
 calculator.add(10)    // 10
 calculator.add(5)     // 15
 
 calculator.subtract(9)  // 6
 calculator.subtract(10) // -4
 
 calculator.multiply(4)   // -16
 calculator.multiply(-10) // 160
 
 calculator.divide(10)   // 16
 calculator.reset()      // 0
 */


class Calculator {
    var value: Double = 0
  
    func add(_ value: Double) -> Double {
        self.value = self.value + value
        return self.value
    }
    func subtract(_ value: Double) -> Double {
        self.value = self.value - value
        return self.value
    }
    func multiply(_ value: Double) -> Double  {
        self.value = self.value * value
        return self.value
    }
    func divide(_ value: Double) -> Double {
        self.value = self.value / value
        return self.value
    }
    func reset() -> Double {
        return 0
    }
}

 let calculator = Calculator()
calculator.value  // 0 ->
calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0



/*
3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
*/
class Square {
    var length: Double
    
    init(length: Double) {
        self.length = length
    }
    
    func getArea() -> Double {
        return length * length
    }
    
    func getPerimeter() -> Double {
        return length * 4
    }
}

class Rectangle {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func getArea() -> Double {
        return width * height
    }
    
    func getPerimeter() -> Double {
        return (width * 2) + (height * 2)
    }
}

class Circle {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func getArea() -> Double {
        return radius * Double.pi
    }
    func circumference() -> Double {
        return 2 * (radius * Double.pi)
    }
}

class Triangle {
    var baseLine: Double
    var height: Double
    
    init(baseLine: Double, height: Double) {
        self.baseLine = baseLine
        self.height = height
    }
    
    func getArea() -> Double {
        return 0.5 * (baseLine * height)
    }
}

class Trapezoid {
    var baseLine: Double
    var height: Double
    var upperLine: Double
    
    init(baseLine: Double, height: Double, upperLine: Double) {
        self.baseLine = baseLine
        self.height = height
        self.upperLine = upperLine
    }
    func getArea() -> Double {
        return 0.5 * height * (baseLine + upperLine)
    }
}

class Cube {
    var length: Double
    
    init(length: Double) {
        self.length = length
    }
    
    func getVolume() -> Double {
        return length * length * length
    }
}

class RectanglularSolid {
    var length: Double
    var width: Double
    var height: Double
    
    init(length: Double, width: Double, height: Double) {
        self.length = length
        self.height = height
        self.width = width
    }
    func getVolume() -> Double {
        return length * height * width
    }
}

class CircularCyilinder {
    var radius: Double
    var height: Double
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
    }
    func getVolume() -> Double {
        return radius * radius * Double.pi * height
    }
}

class sphere {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    func getVolume() -> Double {
        return 4/3 * Double.pi * radius * radius * radius
    }
}

class Cone {
    var radius: Double
    var height: Double
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
    }
    func geVolume() -> Double {
        return 1/3 * Double.pi * radius * radius * height
    }
}

class SignUp {
var name: String
var id: String
var age: Int

    init(name:String, id:String, age:Int){
        self.name = name
        self.id = id
        self.age = age
    }
}
SignUp(name: "박준원", id: "ph-1", age: 35)

