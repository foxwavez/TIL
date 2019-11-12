//두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 -> (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
// input: num1, num2
// output: int(num1+num2)
// work: append



func appendNumber(num1: Int, num2: Int) -> Int {
    let appendNumbers = Int("\(num1)" + "\(num2)")
    return appendNumbers!
}
    appendNumber(num1: 20, num2: 35)
  
    
// 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
// input: "a" "b"
// output: Bool -> true, false
// work: "a" == "b" 확인

func sameString(a: String, b: String) -> Bool {
    if a == b {
        return true
    }
    else {
        return false
    }
}
sameString(a: "icecream", b: "icecream")

// 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
// input : num3
// output:
// work: num3 

/*
func divisor() {
    print()
}
*/

// 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func commonMultiple() {
    // 1 ~ 100
    for number in 1...100{
        if number % 3 == 0 && number % 5 == 0 {
            print(number, terminator: " ")
        }
    }
}
commonMultiple()
