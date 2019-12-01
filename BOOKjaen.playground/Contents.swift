for row in 1...5 {
    print(row)
}
for row in 1...9 {
    print("2 X \(row) = \(row * 2)")
}

var lang = "swift"
for char in lang {
    print("개별 문자는 \(char)입니다.")
}

let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1...size {
    keyword = padChar + keyword
}
print("\(keyword)")

for i in 1..<10 {
    for j in 1..<10 {
        print("\(i) X \(j) = \( i * j)")
    }
}

var n = 2
while n < 1000 {
    n = n * 2
}
print("n = \(n)")

//func divide (base:  Int) {
//    guard base != 0 else {
//        print("연산할 수 없습니다.")
//        return
//    }
//    let result = 100 / base
//    print(result)
//}
//divide(base: 5)
//divide(base: 0)

//func divide (base:  Int) {
//    if base == 0 {
//        print("연산을 처리할 수 없습니다.")
//        return
//    }
//    let result = 100 / base
//    print(result)
//}
//divide(base: 5)
//divide(base: 0)

func divide(base: Int) {
    guard base != 0 else {
        print("연산할 수 없습니다.")
        return
    }
    guard base > 0 else {
        print("base는 0보다 커야 합니다.")
        return
    }
    guard base < 100 else {
        print("base는 100보다 작아야 합니다.")
        return
    }
    let result = (100 / base)
    print(result)
}
divide(base: 102)
divide(base: 0)
divide(base: 9)
