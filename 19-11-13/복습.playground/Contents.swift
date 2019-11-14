
// 타입을 명시할 때
let strArray1: Array<String> = ["apple", "orange"]
let strArray2: [String] = ["apple", "orange"] // ->  이 형식을 자주 쓴다.

// 타입을 명시하지 않을 때
let strArray3 = ["apple", "orange", "melon"]

// 배열에서 엘리먼트를 더해줄 때
// var alphabetArray: Array<String> = []
// var alphabetArray: [String] = []
// var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B") //.append는 추가하는 함수
alphabetArray = alphabetArray + ["C"]
