import UIKit

/*
 191111 강의 Basic(2) 복습
 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 사용)
 */
let number = 6

// 내가 생각한 틀린 답
//switch number {
//case % 2 == 0: // -> 비교하는 값을 case에서 바로 나눌 수 없어서 case 안에서 변수를 생성 해줘야 한다
//    print("\(number) 짝수")
//default:
//    print("홀수")
//}

switch number {
case let x where x.isMultiple(of: 2):
    print("\(x)는 짝수") // case 안에서 생성한 변수는 switch문에서 비교하는 밸류의 값이 들어가게 된다
default:
    print("홀수")
}
