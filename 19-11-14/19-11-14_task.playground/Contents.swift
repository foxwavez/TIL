//1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
//func combineString(str1: String?, str2: String?, str3: String?) -> String {
 // code
// }
// 입력 예시 및 결과
//combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
//combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"

func combineString(str1: String?, str2: String?, str3: String?) -> String {
    var result = ""
    
    result = (str1 ?? "") + (str2 ?? "") + (str3 ?? "")
    
    return result
}
combineString(str1: "AB", str2: "CD", str3: "EF")
combineString(str1: "AB", str2: nil, str3: "EF")





// 2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
//enum Arithmetic {
//  case addition, subtraction, multiplication, division
//}

enum Arithmetic {
    case addition, subtraction, multiplication, division
}

func calTwoShow(arithmetic: Arithmetic, number1: Int, number2: Int) -> Int {
    switch arithmetic {
        case .addition:
            return number1 + number2
        case .subtraction:
            return number1 - number2
        case .multiplication:
            return number1 * number2
        case .division:
            return number1 / number2
    }
}

let plus: Arithmetic = Arithmetic.addition
let plusResult = calTwoShow(arithmetic: plus, number1: 32, number2: 44)
print(plusResult)

let minus = Arithmetic.subtraction
let minusResult = calTwoShow(arithmetic: minus, number1: 162, number2: 14)
print(minusResult)

