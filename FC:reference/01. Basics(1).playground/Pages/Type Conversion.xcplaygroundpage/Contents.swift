//: [Previous](@previous)
/*:
 # Type Conversion
 */

let height = Int8(5)
let width = 10 //10이 Int 값이라고 정의가 된 상태
//let area = height * width //height는 Int8 width는 Int타입이라서 서로 타입이 달라 계산이 되지 않는다. 오류가 난다.
//print(area)


let h = Int8(12)
//let x = 10 * h // 10은 Int라고 정의가 되지 않고 그저 리터럴 값이기 때문에 컴파일러에서 Int8로 추론해서 계산하기 때문에 에러가 나지 않는다.
//print(x)

/*:
 ---
 ## Question
 - 8번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */

let num = 10
let floatNum = Float(num) //타입 컨버젼이라고 해서 타입으로 변환할 때 바꿀타입(변수) 이렇게 사용한다.
type(of: floatNum)

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)


let anInteger: Int = -15
let absNum = abs(anInteger) //abs는 무조건 양수를 바꿔주는 것
type(of: absNum)


//: [Next](@next)
