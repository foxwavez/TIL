//: [Previous](@previous)


import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/*
 Shape
  - Rectangle
  - Triangle
 모두 draw() 오버라이드
 */


/*:
 ---
 ## Upcasting
 ---
 */
print("\n---------- [ Upcasting ] ----------\n")

/*
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
*/


let rect = Rectangle()
rect.color
rect.cornerRadius

(rect as Shape).color // 부모클래스에서 넣어주긴 했지만 변수는 rect 이므로 rect의 컬러 화이트이 나온다
//(rect as Shape).cornerRadius // 오류 -> 부모인 Shape에는 cornerRadius 프로퍼티가 없기 때문에
(rect as Rectangle).color // 자기 자신으로 타입 변환 그러므로흰색
(rect as Rectangle).cornerRadius // 0.0



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //

upcastedRect.color // 흰색 ->
//upcastedRect.cornerRadius  -> 에러 / 컴파일러는 upcastedRect를 Shape로 인식하고 있기 때문에

(upcastedRect as Shape).color // 흰색 ->
//(upcastedRect as Rectangle).color -> 오류 / 부모 클래스(Rect)에서 자식클래스(Shape)로 변환 할 수 없다

// 부모 -> 자식
// 자식 클래스는 부모 클래스가 무조건 하나
// 부모 클래스는 자식 클래스 몇 개> -> 여러 개, 모름
// 부모 클래스에서 자식클래스로 변한이 성공이라는 걸 보장할 수 가 없다.


/*:
 ---
 ## Downcasting
 ---
 */
print("\n---------- [ Downcasting ] ----------\n")

/***************************************************
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 ***************************************************/


let shapeRect: Shape = Rectangle()
var downcastedRect: Rectangle? = Rectangle()

// Rectangle <- Shape
// let human: Human = Student()
// 왜?
// 자식 타입 <- 부모 타입 (X)
// 부모 타입 <- 자식 타입 (O)
// 왜냐면 실제로 사용하려 했더니 사용할 수가 없어서


//downcastedRect = shapeRect //
//downcastedRect = shapeRect as Rectangle // 에러 -> 부모타입(1개)에 자식타입(N개)을 넣는게 반드시 성공하리라는 보장이 없어서

//downcastedRect: Rectangle = shapeRect as? Rectangle  // 부모타입 <- 자식 타입 가능 그러나 / 옵셔널 타입으로 변환되기 때문에 에러
//downcastedRect = shapeRect as! Rectangle  // **** 이 부분 이해가 되지 않는다 놓쳤다.

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
//(value as Float) is Float   // 오류 -> Float와 int는 클래스 관계도 아니고 아무런 상관이 없어서
//(value as? Float) is Float  // false -> nil is Float를 한 결과
//(value as! Float) is Float  // 런타임 오류 (실행하다가 중간에 오류, 컴파일 오류가 아님)


/*:
 ---
 ## Type Check Operator
 ---
 */
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()

let list = [shape, rectangle, triangle]
type(of: list) // 타입은 Shape 왜냐면 수퍼수퍼 클래스이기 때문 -> Triangle(), Rectangle()의 부모 클래스
/*:
 ---
 ### Question
 - 아래 for 문에 대한 실행 결과는?
 ---
 */
//for elem in list {
//  if elem is Shape {
//    print("shape instance")
//  } else if elem is Rectangle {
//    print("rect instance")
//  } else if elem is Triangle {
//    print("triangle instance")
//  }
//}

// "shape instance"이 3 번 찍힌다.
// 순서를 거꾸로 해서 검사를 해야 한다. 그래야 모든 결과가 나온다.



print("\n---------- [ ] ----------\n")

// let list: [Shape] = [shape, rectangle, triangle]
for element in list  {
  element.draw()
}
// list는 Shape 타입이지만
// list 안에 배열 [shape, rectangle, triangle]을 넣었기 때문에
// draw shape / draw rect / draw triangle 이 나온다.


//: [Next](@next)
