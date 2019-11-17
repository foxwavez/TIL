//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201
func reverseNumber (number: Int) -> String {
    var result = ""
    let convertedNumber = String(number)
    for elementNumber in convertedNumber.reversed() {
        result = result + String(elementNumber)
    }
    return result
}

print(reverseNumber(number: 4978))


//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770


func checkDuplicatedNumber (numbers:Int) -> Bool {
    for (index, number) in String(numbers).enumerated() {
        let checkNumber = String(numbers).dropFirst(index+1)
        if checkNumber.contains(number) {
            print("false")
            return false
        }
    }
    print("true")
    return true
}




// for문 순환부분이 1..~ 말고는 이해가 안되서 시도해본 테스트 코드


for number in [8,7,9,4] {
    print(number + 10)
}

for name in ["여우", "펭귄", "물개", "해달", "독수리"] {
    print("사막 \(name)")
}


for name in "우주정복" {
    print("사막 \(name)")
}

let airports: [String:String]? = [
 "ICN":"Korea",
 "KUL":"malaysia",
 "NAR":"japan",
 ]

for airport in airports! {
    print("공항의 이름은 \(String(airport.key))")
}




// Index를 가져오고 싶은데 그냥 하면 에러가 나서 시도해본 테스트 코드

[1, 2,3,4,5].dropFirst(2)

checkDuplicatedNumber(numbers: 459387383)
checkDuplicatedNumber(numbers: 12345678)
checkDuplicatedNumber(numbers: 87654)

for (index, number) in [5,673,2,734,32,3].enumerated() {
    print("지금은 \(index)째 루프입니다.")
    print(number)
}

//
//[5, 673, 2, 734, 32, 3]
//(0, 5) (1, 673) (2, 2) (3, 734) (4, 32) (5, 3)

