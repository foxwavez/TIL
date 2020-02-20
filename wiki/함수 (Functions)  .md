몰랐거나 기억이 안나는 내용은 *기울기 표시* 

# 함수 (Functions)

## 정의와 호출 (Defining and Calling Functions)

함수를 선언할 때는 가장 앞에 `func` 키워드를 붙이고 `(person: String)` 파라미터와 형 그리고 ` -> (String)` 형태로 반환형을 정의합니다.

```swift
func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}
```

정의한 함수에 인자 값을 넣어 호출한 (예)

```swift
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"
```

위 함수에서 메시지를 결합하는 부분과 반환하는 부분을 합쳐서 더 짧게 만들 수 있습니다.

```swift
func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// Prints "Hello again, Anna!"
```

***

## 함수 파라미터와 반환 값 (Function Parameters and Return Values)

### 파라미터가 없는 함수 (Functions Without Parameters)

```swift
func sayHelloWorld() -> String {
  return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"
```

###  복수파라미터를 사용하는 함수 (Functions With Multiple Parameters)

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
  if alreadyGreeted {
    return greetAgain(person: person)
  } else {
    return greet(person: person)
  }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim"
```

### 반환 값이 없는 함수 (Functions Without Return Values)

```swift
func greet(person: String) {
  print("Hello, \(person)!")
}
greet(person: "Dave")
// Prints "Hello, Dave!"
```

> 주의
>
> *엄밀히 말하면 위 함수는 반환 값을 선언하지 않았지만 반환 값이 있습니다. 반환 값이 정의 되지 않은 함수는 Void라는 특별한 형을 반환합니다. Void는 간단히 ()를 사용한 빈 튜플입니다.* 

함수의 반환 값은 아래와 같이 호출 될 때 무시될 수 있습니다.

```swift
func printAndCount(string: String) -> Int {
  print(string)
  return string.count
}
func prinWithouCounting(string: String) {
  let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// Prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// Prints "hello, world" but does not return a value
```

### 복수의 값을 반환하는 함수 (Functions with Mutiple Return Values)

튜플을 함수의 반환 값으로 사용할 수 있습니다.

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}
```

*반환 값의 인자를 반환 값을 접근하는 접근자로 사용할 수 있습니다.* 

```swift
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
```

### 옵셔널 튜플 반환형 (Optioanal Tuple Return Types)

위의 반환 값과 달리 반환 값에 `?` 물음표가 붙었습니다. `(min: Int, max: Int)?` 

```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
  if array.isEmpty { return nil }
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value 
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}
```

실제 반환 값에 접근 하기 위해서는 `if let` 과 같은 옵셔널 체인을 사용하거나 강제 unwrapping을 해야 합니다. 아래는 옵셔널 체인을 사용한 (예)입니다.

```swift
if let bounds = minMax(array: [8, -6, 2, 109. 3, 71]) {
  print ("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"
```

### 함수 인자 라벨과 파라미터 이름 (Function Argument Labels and Parameter Names)

 함수 호출 시 적절한 파라미터 이름을 지정해 함수 내부와 함수 호출 시 사용할 수 있습니다

```swift
func someFunction(firstParameterName: Int, secondParmaterName: Int) {
  // 함수 내부에서 firstParameterName과 secondParameterName의 인자를 사용합니다.
}
someFunction(firstParameterName: 1, secondParmaterName: 2)
```

### 인자 라벨 지정 (Specifying Arguyment Labels)

파라미터 앞에 인자 라벨을 지정해 실제 함수 내부에서 해당 인자를 식별하기 위한 함수 호출 시 사용하는 이름을 다르게 해서 사용할 수 있습니다.

```swift
func someFunction(argumentLabel parmeterName: Int) {
  // 함수 안에서 paramterName로 argumentLabel의 인자값을 참조할 수 있습니다.
}
```

인자 라벨을 지정해서 함수 애부에서 `hometown`으로 값을 제어하고 함수 호출 시에는 인자 값으로 `from` 을 사용한 (예) 입니다.

```swift
func greet(person: String, from hometown: String) -> String {
  return "Hello \(person)! Glad you clould visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Print "Hello Bill! Glad you could visit from Cupertino"
```

### 인자 생략 (Omititng Argument Labels)

파라미터 앞에 `_` 를 붙여 함수 호출 시 인자값을 생략할 수 있습니다.

```swift
func someFuction(_ firstParameterName: Int, secondParmeterName: Int) {
  // 함수 안에서 firstParameterName, secondParametername
  // 인자로 입력받은 첫 번째, 두 번째 값을 참조합니다.
  someFunction(1, secondParmeterName: 2)
}
```

### 기본 파라미터 값 (Default Parmeter Values)

함수의 파라미터 값에 기본 값(`: Int = 12)`을 설정할 수 있습니다. 기본 값이 설정 되어 있는 파라미터는 함수 호출 시 생략할 수 있습니다. 기본 값을 사용하지 않는 파라미터를 앞에 위치 시켜야 함수를 의미있게 사용하기 쉽습니다.

```swift
func someFuction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
  // 함수 호출 시 두 번ㄷ째 인자를 생략하면 함수 안에서
  // paramterWithDefault값은 12가 기본 값으로 사용됩니다.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault:6) 
// parameterWithDefault는 6
someFunction(parameterWithoutDefault: 4)
// parmaeterWithDefault 12
```

### 집합 파라미터 (Vaiadic Parameters)

인자 값으로 특정 형(type)의 집합 값으로 사용할 수 있습니다.

```swift
func artimeticMean(_ numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}
arthmenticMean(1, 2, 3, 4, 5)
// retuen 3.0, which is the artimetic mean of these fivee numbers
arthmenticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```

###  *인-아웃 파라미터 (In-Out Parameters)*

인자 값을 직접 변경하는 파라미터 입니다. 선언을 위해 파라미터 앞에 `ìnout`  이라는 키워드를 사용합니다. 아래는 인자 두 값을 변경하는 함수입니다.

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}
```

아래는 실제로 사용하는 (예) 입니다. *함수의 인자에 변수를 넣을 때 `&` 키워드를 넣었습니다. C언어를 아시는 분은 `ˆinout`  파라미터는 포인터를 넣는다고 생각하시면 이해하기 편하실 것입니다.* 

> 함수를 호출할 때 아예
>
> swapTwoInts(a: &Int, b: &Int) 이렇게 나와서 `&` 키워드를 쓰도록 유도합니다.

``` swift
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and another is now \(anotherInt)")
```

두 변수의 실제 값이 변경되었습니다.

> 주의
>
> 인-아웃 파라미터는 기본 값을 가질 수 없고, 집합 파라미터는 `inout` 으로 선언될 수 없습니다. 인-아웃 파라미터를 사용하는 것은 함수의 반환 값을 사용하지 않고 함구 scope 밖에 영향을 줄 수 있는 또 하나의 방법입니다.

***

