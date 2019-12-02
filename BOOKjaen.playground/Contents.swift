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

func getUseInfo() -> (Int, Character, String) {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    return (height, gender, name)
}

var uInfo = getUseInfo()
uInfo.0

var (a,b,c) = getUseInfo()

func printHello(_ name: String, _ msg: String) {
    print("\(name)님 , \(msg)")
}
printHello("홍길뿅", "안녕하세용")

func avg(score:Int...) -> Double {
    var total = 0
    for r in score {
        total = total + r
    }
    return (Double(total)/Double(score.count))
}
print(avg(score: 10, 20, 30, 40))

// 기본값이 지정된 함수
func echo(message: String, newLine: Bool = true){
    if newLine == true {
        print(message, true)
    } else {
        print(message, false)
    }
}
echo(message: "안녕하세요")
echo(message: "안녕하세요", newLine: true)
echo(message: "안녕하세요", newLine: false)

func incrementBy(base: Int) -> Int {
    let base = base + 1
    return base
}
incrementBy(base: 9)

func descAge(name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    // 입력된 값을 변경합니다.
    name = name + "씨"
    paramAge = paramAge + 1
    return "\(name)의 내년 나이는 \(paramAge)세 입니다."
}
descAge(name: "희진", 24)
 
var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value = value + 1
    return value
}

print(autoIncrement(value: cnt))
print(cnt)

var count = 30

func foo(count: Int) -> Int {
    var count = count
    count = count + 1
    return count
}
print(foo(count: count))
print(count)

func coo(base: Int) -> String {
    print("함수 coo가 실행됩니다.")
    return "결과값은 \(base + 1)입니다"
}
let fn1 = coo(base: 9)
let fn2 = foo
fn2(7)

func boo(age: Int) -> String {
    return "\(age)"
}

func boo(age: Int, name: String, height: Int) -> String {
    return "\(name)의 나이는 \(age)세 입니다, 키는 \(height)"
}

let t:(Int, String, Int) -> String = boo
let t1:(Int) -> String = boo(age:)
let t2 = boo(age: 9)
let t3 = boo(age: 19, name: "짤랑", height: 198)

func boo(age: Int, name: String) -> String {
    return "\(name)의 나이는 \(age)세 입니다."
}

func boo(height: Int, nick: String) -> String {
    return "\(nick)의 키는 \(height)cm 입니다."
}
let fn03 = boo(age:name:)
let fn04 = boo(height:nick:)

func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String { // 오른쪽 반환타아입은 함수 타입으로 작성되어 있음을 알 수 있다.
    return desc
}

let p = pass()
p()

func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int)-> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr(param:))
