// Value가 Bool 타입이므로 case는 true /false 두 가지 경우만 존재
let isTrue = true
switch isTrue {
  case true:
  print("true")
  case false:
  print("false")
}
// Int는 범위연산자(0...30)를 이용해 특정 범위 값에 대한 case 작성
let count = 30
switch count {
    case 0...30:
    print("true")
    case 31...90:
    print("over number")
    default:
    print("false")
}


let someCharacter: Character = "e"

switch someCharacter {
    case "a", "e", "i", "o", "u":
    print("\(someCharacter)는 모음입니다.")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter)는 자음입니다.")
    default:
    print("\(someCharacter)는 모음 또는 자음이 아닙니다.")
}



let somePoint = (9, 0)
// x,y 좌표

switch somePoint {
case (let mile, 0), (0, let mile):
    // y좌표가 0 일 때, 또는 x 좌표가 0일 때 각각 x좌표와 y좌표를 mile 변수로 받아옴
    print("축의 원점에서, \(mile)")
default:
    // x 또는 y 좌표가 0이 아닌 좌표에 대한 경우
    print("축이 아니다")
}

let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
    // x, y는 anotherPoint에서 값을 가져오고 (value Bindig)
    // x, y가 x == y 일 때만 프린트를 실행해라
    print("\(x),\(y) is on the line x == y")
case let (x, y) where x == -y:
    // x, y가 x == -y 일 때만 프린트를 실행해라
    print("\(x),\(y) is on the line x == -y")
case let (x, y):
    // 위에 case에서 아무것도 조건이 맞지 않는다면 프린트를 실행해라
    // default는 위 case 외에 모든 경우를 다 실행 하기 때문에 조건을 걸어줄 없어
    // case let으로 작성해야 한다
    print("\(x),\(y) is just some arbitrary point")
}

let sampleChar: Character = "a"
switch sampleChar {
case "a":
fallthrough
case "A":
// fallthrough를 사용해줬기 때문에 실행 흐름이 여기까지 이어진다.
print("글자는 A입니다")
default :
print("일치하는 글자가 없습니다")
}


func someFuntion () {
    let isTrue = Bool.random()
    guard isTrue else {
        return
    }
          // isTrue가 true인 경우에 실행한다.
}

let arr = [9, 1, 7]
for item in arr {
    print(item)   // 9 1 7
}

for value in 1...10 {
    print(value)
}

for ch in "Penguin" {
    print(ch)
}

for _ in 1...3 {
    print("Penguin") // 3번 반복
}

OUTER: for i in 0...3 {
    INNER: for j in 0...3 {
        if i > 1 {
            print("j :" , j)
            // confinue INNER
            break OUTER
        }
        print (" inner \(j)")
    }
    print ("outer \(i)")
}
/* Print*/
//   inner 0
//   inner 1
//   inner 2
//   inner 3
// outer 0
//   inner 0
//   inner 1
//   inner 2
//   inner 3
// outer 1
// j : 0

var threeValues: (Int, Double, String) = (10, 100.0, "이름")

print(threeValues)

threeValues.0 = 5
threeValues.1 = 10.0
threeValues.2 = "Name"

print(threeValues)
