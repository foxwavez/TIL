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

// collection type에서 배열만 index가 있어 순서가 차례대로 있다

let dict: [String: String] = [
    "철수": "apple",
    "영희": "banana",
    "진수" : "grape",
    "미희" : "strawberry"
]

// 함수를 구현한다 ()는 parameter의 타입의 목록을(parameter가 여러개가 될 수 있기 때문에 목록들) 적는 곳이다
func match(dict: [String: String]) -> [String] {
    var result: [String] = []
    
    for findE in dict {
        let fruit = findE.value
        if fruit.contains("e") {
            // "e"가 포함된 문자일 경우에 아래 statement가 실행된다.
            result.append(fruit)
        }
    }
    // contains == collectiontype에서 쓰는 메소드고 이게 속해 있는지 아닌지 확인 하는 메소드
    return result
}

match(dict: dict)
// match 라는 함수를 실행한다. 호출한다
// () -> 호출하는 경우 이게 뒤에 붙으면 실행한다는 뜻이다


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


let airport: [String: String] = [
    "ICN": "Korea",
    "NAR": "Japan",
    "KUR": "malaysia"
]

 // 2개 return N을 가지고 있는 key  / a를 가지고 있는 value
//for find in airport {
//
//}

func test(dict: [String: String]) -> ([String], [String]) {
    var keys: [String] = []
    var values: [String] = []
    
    for (aa, bb) in dict {
        
        if let _ = aa.firstIndex(of: "N") {
                        // firstIndex 어떠한 배열 안에 of에 들어가는 해당 값이 있는지 없는 지 확인하고, 있다면 몇 번째 위치인지를 알려준다,
                        // 하지만 배열 안에 of에 들어가는 해당 값이 있는 지 없는 지 모르기 때문에 optional 값으로 반환
            keys.append(aa)
        }
        
//        if bb.contains("a") {
//            values.append(bb)
//        }
        
        for x in bb {
            if x == "a" {
                values.append(bb)
            }
        }
        
    }
    
    return (keys, values)
}

let temp = test(dict: airport)

print("N 을 가지고 있는 key 들", temp.0)
print("a 를 가지고 있는 value 들", temp.1)


let ints = [1, 3, 5]
