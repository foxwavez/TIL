몰랐거나 기억이 안나는 내용은 *기울기 표시* 

# 제어문 ( Control Flow)

Swift에서는 `while loop` ,` ìf guard` ,  `switch` , `for-in` 문 등 많은 제어문을 제공합니다.

<hr/>

## For-In 문 (For-In Loops)

`for-in` 문은 배열, 숫자, 문자열을 순서대로 순회(iterate)하기 위해 사용합니다.

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
  print("hello,\(name)")
}
// Hello, Anna
// Hello, Alex
// Hello, Brian
// Hello, Jack
```

딕셔너리에서 반환된 키(key)-값(vlaue) 쌍으로 구성된 튜플을 순회하며 제어할 수도 있습니다.

```swift
let numberOflegs = ["spider": 8, "ant": 6, "cat: 4"]
for (animalName, legCount) in numberOfLegs {
  print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// spiders have 8 legs
// cats have 4 legs
```

딕셔너리에 담긴 아이템은 인덱스가 없기 때문에  *정렬되지 않은 상태입니다. 딕셔너리에 넣었던 순서대로 순회되지 않습니다.*  이와 같이 숫자 범위를 지정해 순회할 수 있습니다.

```swift
for index in 1...5 {
print ("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

`for-In` 문을 순서대로 제어할 필요가 없다 변수자리 `_` 키워드(와일드카드)를 사용하면 *성능을 높일 수 있습니다.* 

```swift
let base = 3
let power = 10 
var answer = 1
for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(powee) is \(answer)")
// Prints "3 to the power of 10 is 59049"
```

범위 연산자와 함께 사용할 수 있습니다.

```swift
let minutes = 60
for tickMark in 0..<minutes {
  // render the tick mark each minute (60 times)
}
```

*`stride(from:to:by)` 함수와 함께 사용할 수 있습니다. 다음은 구간(stride)을 5로 설정한 경우입니다.* 

```swift
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: miniteInterval) {
  // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
```

stride 구간을 3으로 설정한 경우

```swift
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval)
```

<hr/>



