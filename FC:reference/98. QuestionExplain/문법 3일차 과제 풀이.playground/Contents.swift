import Foundation

//: ### [ 실습 ]
/*
 [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
 */
print("\n---------- [ ] ----------\n")

func searchContainingE(dict: [String: String]) -> [String] {
  var result: [String] = []
  for (key, value) in dict {
    if value.contains("e") {
      result.append(key)
    }
  }
  return result
}

let prefFruits = [
  "철수": "apple",
  "영희": "banana",
  "진수": "grape",
  "미희": "strawberry"
]
searchContainingE(dict: prefFruits)



/*
 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
 */
print("\n---------- [ ] ----------\n")

func swapNumbers(arr: [Int]) -> [Int] {
  var frontArr: [Int] = []
  var rearArr: [Int] = []
  
  for number in arr {
    if number.isMultiple(of: 2) {
      rearArr.append(number)
    } else {
      frontArr.append(number)
    }
  }
  return frontArr + rearArr
}

swapNumbers(arr: [2, 8, 7, 1, 4, 3])
swapNumbers(arr: [32, 12, 59, 89, 38, 45, 11])


/*
 0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
 입력 : [1, 3, 3, 3, 8]
 결과 :
 숫자 1 : 1개
 숫자 3 : 3개
 숫자 8 : 1개
 */

print("\n---------- [ ] ----------\n")

func countNumbers(from arr: [Int]) {
  var countArray = Array<Int>(repeating: 0, count: 10)
  for num in arr {
    countArray[num] += 1
  }
  
  for (number, count) in countArray.enumerated() {
    guard count > 0 else { continue }
    print("숫자 \(number) : \(count)개")
  }
}

let numArr1 = [7, 1, 5, 3, 5, 9, 1, 7, 0, 2, 3, 9, 9, 1]
let numArr2 = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1]
countNumbers(from: numArr1)
print()
countNumbers(from: numArr2)




//: ### [ 과제 ]

/*
 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
 ex) 123 -> 321 , 10293 -> 39201
 */

func reverseDigit(num: Int) -> Int {
  var reversedNumber = 0
  var num = num
  
  while num > 0 {
    reversedNumber = reversedNumber * 10 + num % 10
    num /= 10
  }
  
  return reversedNumber
}


print(reverseDigit(num: 123))
print(reverseDigit(num: 10293))
print(reverseDigit(num: 824))



/*
 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
 ex) true - 123, 310, 369   /  false - 100, 222, 770
 */
print("\n---------- [ ] ----------\n")

func isAllDigitDiff(num: Int) -> Bool {
  guard 100...900 ~= num else {
    print("100 ~ 900 사이의 숫자만 입력하세요")
    return false
  }
  let numStr = String(num)
  let uniqueValues = Set(numStr)
  return uniqueValues.count == numStr.count
}

print(isAllDigitDiff(num: 123))
print(isAllDigitDiff(num: 369))
print(isAllDigitDiff(num: 222))
print(isAllDigitDiff(num: 770))



//: ### [ 도전 과제 ]


/*
 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 e.g. ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
 */

print("\n---------- [  ] ----------\n")

// 아래는 Array를 이용한 풀이 방식.
// Dictionary를 이용한 방식으로도 고민해서 풀어보세요.

func printUniqueValues(from arr: [String]) -> [String] {
  var recordArr: [String] = []
  var result: [String] = []
  
  for str in strArr {
    if !result.contains(str) && !recordArr.contains(str) {
      result.append(str)
    } else if let index = result.firstIndex(of: str) {
      result.remove(at: index)
      recordArr.append(str)
    }
  }
  return result
}

let strArr = ["a", "b", "c", "a", "e", "d", "c"]
print(printUniqueValues(from: strArr))




/*
 식육목 모식도 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터 저장하기
 + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
 */
//: ![식육목 모식도](image.png)
print("\n---------- [  ] ----------\n")

let dict = [
  "식육목": [
    "개과": [
      "개": [
        "자칼",
        "늑대",
        "북미산 이리",
      ],
      "여우": [
        "아메리카 여우",
        "유럽 여우",
      ]
    ],
    "고양이과": [
      "고양이": [
        "고양이",
        "살쾡이"
      ],
      "표범": [
        "사자",
        "호랑이"
      ]
    ]
  ]
]

if let 식육목 = dict["식육목"],
  let 고양이과 = 식육목["고양이과"],
  let 표범속 = 고양이과["표범"] {
  for 종 in 표범속 {
    print(종)
  }
}

