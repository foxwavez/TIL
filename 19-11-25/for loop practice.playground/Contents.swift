//for max in 1...5 {
//    for _ in 1...max {
//        print("*", terminator: "")
//    }
//    print()
//}


//var text = "This is a swift book Apple's programming language"
//var result = ""
//
//for char in text {
//    if char == " "  {
//        result.append(Character("_"))
//        continue
//    } else if char == "o" {
//        result.append(Character("O"))
//        continue
//    }
//    result.append(char)
//}
//print(result)

//var loopFlag = true
//
//for i in 1...5 {
//    for j in 1...9  {
//        if (j==3) {
//            loopFlag = false
//            break
//        }
//        print ("\(i) X \(j) = \(i * j)")
//    }
//    if (loopFlag == false) {
//        break
//    }
//}

//outer: for i in 1...5 {
//    inner: for j in 1...9 {
//        if (j==3) {
//            break inner
//        }
//        print("\(i) X \(j) = \(i * j)")
//    }
//}

//var cities = ["seoul", "NewYork", "LA", "Santiago"]
//print(cities[1])

//var cities = ["Seoul", "New York", "LA", "Santiago"]
//let length = cities.count
//
//for i in 0..<cities.count {
//    print ("\(i) 번재 배열 원소는 \(cities[i]) 입니다")
//}
//for row in cities {
//    print("배열 원소는 \(row)입니다.")
//}

//var cities = ["Seoul", "New York", "LA", "Santiago"]
//for row in cities {
//    let index = cities.firstIndex(of: row)
//    print("\(index!)번째 배열 원소는 \(row)입니다")
//}
//
//Array<Int>()
//
//var cities2 = Array<String>()
//
//var cities1 : Array<String>
//cities1 = Array()
//
//let strArray : [String] = ["집에", "가고", "싶다"]
//let strArray2 = ["침대에", "눕고", "싶다"]
//
//var cities3 = [String]()
//
//cities3.append("seoul")
//cities3.append(contentsOf: ["Dubai", "Sydney", "Kualalumpur"])
//cities3.insert("Tokyo", at: 0)
//cities3[1] = "Madrid"
//cities3
//
//var alphabet = ["a", "b", "c", "d", "e"]
//alphabet[0...2]
//alphabet[4]
//
//alphabet[1...2] = ["1", "2", "3"]
//alphabet
//alphabet.count
//alphabet[2...4] = ["A"]
//alphabet
//
//var g: Set<String> = []
//
//var genres : Set = Set<String>()
//
//genres.insert("Classic")
//genres.insert("Rock")
//genres.insert("Balad")
//
//if genres.isEmpty {
//    print("집합이 비어있습니다")
//} else {
//    print("집합에는 현재 \(genres.count)개의 아이템이 저장되어 있습니다")
//}
//for g in genres.sorted() {
//    print("\(g)")
//}

//for _ in 1...5 {
//    for row in 1...5 {
//        if row == 2 || row == 3 || row == 4 {
//            print(terminator: " ")
//        }
//        else if row == 1 || row == 5 {
//            print("*", terminator: "")
//        }
//    print()
//    }
//}

func convertStringArray(with numbers: [Int]) -> [String] {
//    let numbers = [1, 2, 3, 4, 5]
    
    var strArr = [String]()
    for num in numbers {
        let str = String(num)
        strArr.append(str)
    }
    
//    let intItem0 = String(numbers[0])
//    let intItem1 = String(numbers[1])
//    let intItem2 = String(numbers[2])
//    let intItem3 = String(numbers[3])
//    let intItem4 = String(numbers[4])
//
//    strArr.append(contentsOf: [intItem0, intItem1, intItem2, intItem3, intItem4])
    return strArr
}
//
//let intArry = [1, 2, 3, 4, 5]
//let intArr0 = String(intArry[0])

let numbers = [1, 2, 3, 4, 5]
let intItem0 = String(numbers[0])
let intItem1 = String(numbers[1])
let intItem2 = String(numbers[2])
let intItem3 = String(numbers[3])
let intItem4 = String(numbers[4])
var strArr = [String]()
strArr.append(contentsOf: [intItem0, intItem1, intItem2, intItem3, intItem4])

var oddDigits : Set = [1, 3, 5, 7, 9]
let evenDigits : Set = [0,2, 4, 6, 8]
let primeDigitss : Set = [2, 3, 5, 7]

oddDigits.intersection(evenDigits).sorted()

let tupleValue = ("a", "b", 1.5, true)
tupleValue.1

func getTupleValue() -> (String, String, Int) {
    return ("t", "v", 100)
}
let (a,b,c) = getTupleValue()

var max = [50, 23, 29, 1, 45, 39, 59, 19, 15]
max.max()

func introduce(name: String, age: Int)  {
    print("안녕하세요 저의 이름은 \(name), 저의 나이는 \(age) 입니다")
}

introduce(name: "이희진", age: 24)

func evenNumber(number: Int) {
    if number % 2 == 0 {
        print("\(number)는 2의 배수 입니다")
    }
    else {
        print("\(number)는 2의 배수가 아닙니다")
    }
}
evenNumber(number: 3)
evenNumber(number: 4)

func multiple (number2: Int) -> Int {
    let number1: Int = 10
    return number1 * number2
}
multiple(number2: 4)


func average(score1: Int, score2: Int, score3: Int, score4: Int) -> Int {
    let sum = score1 + score2 + score3 + score4
    return sum / 4
}
average(score1: 90, score2: 80, score3: 70, score4: 60)

func credit(score: Int) -> Character {
    if score >= 90 {
        return "A"
    }
    else if score >= 80 {
        return "B"
    }
    else if score >= 70 {
        return "C"
    }
    else {
        return "D"
    }
}
credit(score: 68)

func aa(number1: Int, number2: Int) -> Int {
    let sum = String(number1) + String(number2)
    return Int(sum)!
}
aa(number1: 10, number2: 10)

func sameString(string1: String, string2: String) {
    if string1 == string2 {
        true
    }
    else {
        false
    }
}
sameString(string1: "멍청", string2: "멍청")

func measure(number: Int) {
    for n in 1...number {
        if number % n == 0 {
            print(n)
        }
    }
}
measure(number: 9)

//func multiple() {
//    for n in 1...300 {
//        if n % 3 == 0 || n % 5 == 0 {
//            print(n)
//        }
//    }
//}
//multiple()

