//: [Previous](@previous)
/*:
 # Type Annotation & Type Inference
 */

/*:
 ---
 ## Type Annotation
 * 변수 선언 시 사용될 자료의 타입을 명확하게 지정하는 것
 ---
 */
let year: Int = 2019

let language: String // 타입 어노테이션을 하지 않으면
language = "Swift" // 변수에 값을 넣어주는 것 초기화 할 때 에러가 난다 (밑에 줄에서 할 경우에)

var red, green, blue: Double // : Int : String 과 같이 자료 타입을 명시하는 걸 타입 어노테이션이라고 한다.
red = 255.0
green = 150.123
blue = 75

/*:
 ---
 ## Type Inference
 * 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 타입을 추론하여 적용하는 것
 ---
 */
let name: String = "Tori"
type(of: name)

let age: Int = 4 // 타입 인퍼런스 -> 타입 추론 
type(of: age)

var weight = 6.4
type(of: weight)

var isDog = true
type(of: isDog)


//: [Next](@next)
