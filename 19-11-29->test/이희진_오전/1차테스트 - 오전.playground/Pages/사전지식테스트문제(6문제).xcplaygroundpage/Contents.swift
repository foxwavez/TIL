//: [Previous](@previous)

/***************************************************
 "Hello, World!" 문자열을 출력하기 위한 코드 작성
 ***************************************************/

print("Hello, World!")

/***************************************************
 2개의 정수를 입력 받아서 그 숫자들을 더한 뒤 결과를 정수로 반환하는 함수 작성
 ***************************************************/

func sum(number1: Int, number2: Int) -> Int {
    return number1 + number2
}
sum(number1: 3, number2: 4)
sum(number1: 64, number2: 190)

/***************************************************
 2개의 정수를 입력 받아 그 숫자들을 곱한 뒤 결과값을 문자열로 반환하는 함수 작성
 ***************************************************/

func multiple(number1: Int, number2: Int)-> String {
    let n = number1 * number2
    return String(n)
}
multiple(number1: 4, number2: 9)
multiple(number1: 72, number2: 58)

/***************************************************
 주어진 숫자가 짝수인지 홀수인지 판단하는 함수 작성 (switch 문으로 해결)
 ***************************************************/

func oddEven(number: Int) {
    switch true {
    case number % 2 == 0:
        print("짝수 입니다.")
    default:
        print("홀수 입니다.")
    }
}
oddEven(number: 3)
oddEven(number: 4)


/***************************************************
 Swift 3가지 다른 반복문 방식별로 각각 1부터 10까지 값을 더한 결과를 출력하는 코드 작성
 ***************************************************/

var sum = 0
for number in 1...10 {
    sum = sum + number
}
print(sum)

while sum < 11 {
    sum = sum + 1
}
print(sum)

var sum1 = 0
repeat {
    sum1 = sum1 + 1
}
while sum1 < 55
print(sum1)



/***************************************************
 Swift 에서 사용하는 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지, 그리고 그 특징에 대해 설명
 ***************************************************/

// upper camel case: 프로젝트 이름, 클래스 이름에 사용된다. -> 맨 앞글자가 대문자 다음 문자 앞글자가 또 대문자 ex. ScoreAverage
// camel case: 변수 이름, 함수 이름에 사용된다. -> 문자의 맨 앞글자가 소문자 다움 문자 앞글자가 대문자 ex. scoreAverage



/***************************************************
 사전 지식 테스트 때 위 내용들을 제대로 푸신 분이 거의 없었는데
 지금은 대부분 많이 쉽죠?
 그만큼 많이 발전하셨습니다. :)
 ***************************************************/

//: [Next](@next)
