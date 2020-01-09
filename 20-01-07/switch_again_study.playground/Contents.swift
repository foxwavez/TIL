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
                    // (of: number) number의 배수를 알 수 있는 함수
    print("\(x)는 짝수")
// case 안에서 생성한 변수는 switch문에서 비교하는 밸류의 값이 들어가게 된다
default:
    print("홀수")
}

switch number {
case let y where y % 2 == 0:
    print("\(y)는 짝수네요")
default:
    print("홀수")
}


/*
191111 강의 Basic(2) 복습
조건문 안에 Range 쓰는 방법 (if, switch, guard 예시)
*/

//func update(age: Int) {
//    if 1...100 ~= age { // if문은 조건이 맞으면 코드를 실행됨
//        print("Update")
//    }
//}

// 범위를 할당해서 넣을 경우에는 "~=" 써야한다
// = 을 넣어서 사용할 경우에 컴파일 문법 오류가 난다

//func update(age: Int) {
//    switch age {
//    case 1...100: print("Update")
//    default: break
//    }
//}

func update(age: Int) {
    guard 1...100 ~= age else { return } // guard문은 조건을 만족할 때만 다음으로 넘어가는 특징을 가짐
    // 조건을 만족하지 않으면 종료된다 -> 다음으로 넘어가지 않아 그 밑에 코드들이 실행되지 않는다
    print("Update") // condition이 true 일 경우에 실행
}

update(age: 20)
