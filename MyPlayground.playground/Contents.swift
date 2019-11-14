/*
 [ 실습 문제 ]
 <1>
 [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
 <2>
 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
 <3>
 0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
 입력 : [1, 3, 3, 3, 8]
 결과 : "숫자 1 : 1개, 숫자 3 : 3개, 숫자 8 : 1개"
 */

let dict: [String: String] = ["철수": "apple", "영희": "banana", "진수" : "grape", "미희" : "strawberry"]
func match(dic: [String: String]) -> [String] {
    
}


func asdf(input: [Int]) {
    for item in input {
        if item % 2 == 0 {
            // 짝수
        } else {
            // 홀수
        }
    }
}


/*
 [ 과제 ]
- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
  ex) 123 -> 321 , 10293 -> 39201
- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
  ex) true - 123, 310, 369   /  false - 100, 222, 770
 */



//func numberReverse (number: Int)-> Int {
//    let num = number
//    let numString = String(num)
//    let numReverse = numString.reversed()
//    return 123
//}
//numberReverse(number: 123)








