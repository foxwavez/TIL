// 1.이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
func person(name: String, age: Int) {
  print("안녕하세요 \(name)입니다. 나이는 \(age)살 입니다. 잘 부탁드립니다")
}
person(name: "이희진", age: 24)



// 2. 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func checkMultiple2(number: Int) -> Bool {
    let a = number
    if a%2 == 0{
        print("\(number)는 2의 배수입니다")
        return a%2 == 0
    } else {
        print("\(number)는 2의 배수가 아닙니다")
        return a%2 == 0
    }
}
checkMultiple2(number: 10001)
checkMultiple2(number: 1000)



// 3.정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func doubleMutiply(a: Int, b: Int = 10) -> Int {
    print("결과값은 \(a * b)입니다.")
    return a * b
}
doubleMutiply(a: 900)


// 4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func averageScore(a: Int, b: Int, c: Int, d:Int) -> Int {
    print("평균 점수는 \((a + b + c + d)/4) 입니다")
    return (a + b + c + d)/4
}
averageScore(a: 90, b: 100, c: 96, d: 78)


// 5. 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func scoring(score: Int) -> Bool {
    let b = score
    if b >= 90 {
        print("당신의 학점은 A입니다.")
        return b >= 90
    }
    else if b >= 80 {
        print("당신의 학점은 B입니다.")
        return b >= 80
    }
    else if b >= 70 {
        print("당신의 학점은 C입니다.")
        return b >= 70
    }
    else {
        print("당신의 학점은 F입니다.")
        return b < 70
    }
}
scoring(score: 95)
scoring(score: 85)
scoring(score: 75)
scoring(score: 60)



// 6. 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func averageScoring(score: Int...) -> Bool {
    var result = 0
    for result in score {
    
    }
    var i: Int
    if i >= 90 {
        print("당신의 학점은 A입니다.")
        return i >= 90
    }
    else if i >= 80 {
        print("당신의 학점은 B입니다.")
        return i >= 80
    }
    else if i >= 70 {
        print("당신의 학점은 C입니다.")
        return i >= 70
    }
    else {
        print("당신의 학점은 F입니다.")
        return i < 70
    }
    return result
}
averageScoring(score: 95, 85, 75, 65)


