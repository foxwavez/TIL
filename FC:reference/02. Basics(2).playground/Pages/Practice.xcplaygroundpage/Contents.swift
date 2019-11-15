//: [Previous](@previous)
/*:
 # Practice
 */
/*:
 ---
 ## Conditional Statements
 ---
 */
/*
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 */

func getGrade(score: Double) -> String {
    if score == 4.5 {
        return "A+"
    } else if score >= 4.0 {
        return "A"
    } else if score >= 3.5 {
        return "B+"
    } else if score >= 3.0 {
        return "B"
    } else {
        return "F"
    }
}

//
//    var grade: String
//    switch score {
//    case 4.5:
//        grade = "A+"
//    case 4.0..<4.5:
//        grade = "A"
//    case 3.5..<4.0:
//        grade = "B+"
//    default:
//        grade = "F"
//    }
//    return grade
//}



/*:
 ---
 ## Loops
 ---
 */
/*
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
   ex) 5! = 5 x 4 x 3 x 2 x 1
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
   (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
   (1234 인 경우 각 자리 숫자를 합치면 10)
 */
func factorial(number: Int) -> Int {
    var target0 = 1
    for value in 1...number {
        target0 = target0 * value
    }
    return target0
}
factorial(number: 5)


func aa(number1: Int, number2: Int) -> Int {
    var result0 = 1
    for _ in 1...number2 {
        result0 = number1 * result0
    }
    return result0
}
aa(number1: 2, number2: 5)



func sumDigit(number: Int) -> Int {
    var result: Int = 0
    var target = number
    for _ in 1...String(number).count {
        let share = target / 10
        let rest = target % 10
        result = result + rest
        target = share
    }
    return result
}
sumDigit(number: 123)

/*:
 ---
 ## Control Transfer
 ---
 */
/*
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */

func sum2(number: Int) -> Int {
    var target1 = 0
    for addition in 1...number {
        target1 = target1 + addition
        if target1 > 2000 {
            print("over 2000")
            return target1
        }
    }
    print("less 2000")
    return target1
}
sum2(number: 100)

func sum3 () -> Int {
    var target2 = 0
    for add in 1...50 {
        if add < 20 || add > 30 {
        target2 = target2 + add
        }
    }
    return target2
}

sum3()
//: [Next](@next)
