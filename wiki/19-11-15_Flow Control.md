# 흐름 제어 (Flow Control)

* Condition Statement `if`, Loop `for`, Control Transfer `break` 등 프로그램의 실행 흐름을 제어할 수 있는 방법들

## Condition Statements

### If Statement

* `condition` 에 따라 내부 코드 실행을 결정 
* `Bool` 타입의 값을 반환하는 것이 `condition` 에 사용가능 

```swift
if condition {
// condition1(조건1),
}
```

* 여러가지 `condition` 을 콤마 `,` 로 구분해서 사용 가능. `&&` 와 같다

```swift
if condtion1, condition2 {
// condition1(조건1), condition2(조건2)가 전부true라면 실행
}
```

### If - else Statements

* `condition` 이 `false` 일 때 실행될 코드를 `else` 내부에 작성

* `else if` 를 이용해 여러 가지 `condition` 에 대해 비교 가능

  ```swift
  if condition {
  // condition(조건)이 true라면 실행
  }
  else if condition2 {
  // condition(조건)이 false이고, condition2(조건2)가 true라면 실행
  }
  else {
  // condition(조건)과 condition2(조건2)가 모두 false 라면 실행
  }
  ```

  * 마지막에 `else` 가 생략되면 실행되지 않은 경우가 발생. `else` 가 있으면 어떤 경우든 반드시 어떤 코드가 실행됨
  * `else` 가 생략 되려면 `condition` 이 위에 모두 충족 되는 경우에는 가능하다

  ### `if - else if `와 `if`두 개를 사용하는 것의 차이

  * If-else if 는 하나의 condition에 대해 한 번만 검사
  * if를 두 번 쓰면 각 if 절에 대해 조건을 두 번 검사하게 됨
  * **실행 흐름이 들어가는지 아닌지에 따른 차이** 

  

  ## Switch Statements

  * `switch` 로 평가할 대상  `value` 에 대해  case 에 따라 다른 코드 실행
  * `if` 와 달리 모든 경우에 대해 다뤄야 함. `case` 가 모든 경우를 다루거나 `defalut`를 반드시 구현

  ```swift
  switch value {
    case value1:
    // value가 value1 일 때 실행
    case value2, value3:
    // value가 value2와 value3를 모두 일치할 때 실행
    default:
    // 위 value가 case의 value(1,2,3)들을 모두 일치하지 않을 때
  }
  ```

  * `value`와 `case`의 타입이 반드시 일치해야 함

  ```swift
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
  ```

  

  ## Switch: Compound cases

  * `case` 에서 콤마 `,` 를 이용해서 여러 가지 경우를 함께 묶을 수 있음
  *  `if` 는 콤마가 AND `&&`  연산과 같지만, `switch-case` 에서는 OR `|| ` 연산과 같음

  ```swift
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
  ```

  ## Switch : Value Binding

  * 튜플같은 자료형으로 주로 사용됨
  * 특정 값을 지정하지 않고 변수만 선언하고, 변수로 선언한 부분은 어떤 값이든 받을 수 있음
  * `var` 로 값을 받을 수도 있지만 값을 가져와서 사용하는 경우 이므로 `let`을 사용해서 값이 바뀌지 않도록 하는 것이 좋음
  * 바인딩이란 case 안에 value를 직접 작성하는 게 아니라 위에 let somePoint에서 값을 가져온다는 걸 뜻한다

  ```swift
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
  ```

  ## Switch: Where Clause

  * `where` 뒤에 있는 것은 if의  `condition` 과 유사하다 `where`  뒤에 조건이 성립해야만 case가 실행된다.

  ```swift
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
  ```

  

  ## Switch : Early Exit  

  * Swift의 caseㄴ는 하나의 경우에 대해 실행하면 자동으로 빠져나감
  * `fallthrough`를 사용하면 아래의 다른 case들까지 실행을 이어지게 할 수 있음

  ```swift
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
  ```

  ## Guard Statement

  * `if`와 반대로 `condition` 이 false 인 경우 내부 코드를 실행

  * `guard` 의 `else` 부분에는 반드시  `return` 또는 `break` 같이 실행을 종료시키는 명령이 있어야 함

    ```swift
    guard condition else {
      // condition(조건)이 false 일 경우만 실행된다
      break
    }
    ```

    * 함수에서 특정 조건을 만족하지 않을 때 다른 코드 실행 없이 함수를 바로 종료하기 위한 용도로 사용

    ```swift
    
    func someFuntion () {
        let isTrue = Bool.random()
        guard isTrue else {
            return
        }
              // isTrue가 true인 경우에 실행한다.
    }
    
    ```

## Loops

### For - In

```swift
for itmem in items {
  // some code
}
```

* 배열 `array`, 딕셔너리 `dictionary` 등 collection type에 대한 각각의 item을 순회하며 반복

```swift
let arr = [9, 1, 7]
for item in arr {
    print(item)   // 9 1 7
}
```

* 범위 연산자(1...10)를 이용한 `Range` 타입에서 각 value를 순회하며 반복
* in 뒤에 arr는 [9, 1, 7]의 값을 가지고 있는게 아니라 9 -> 첫번쩨 / 1 -> 두번째 / 7 -> 3번째 총 3 번은 순회한다는 의미이다. item은 마치 let iteml = arr 를 한 것과 같이 생각하면 된다
* 9
* 1
* 7  이렇게 출력된다

```swift
for value in 1...10 {
    print(value) // 1... 10
}
```

* 범위 연산자를 이용한 `Range` 타입에서 각 value를 순회하며 반복

```swift
for ch in "Penguin" {
    print(ch)
}
```

* 문자열에 대해 각각의 문자 `Charater` 를 순회하며 반복

```swift
for _ in 1...3 {
    print("Penguin") // 3번 반복
}
```

`_` 를 이용해서 값은 사용하지 않고 단순히 횟수를 반복하는 용도

### While

* `condition`이 `false`가 될 때 까지 반복하여 코드 실행
* 첫 번째 반복이 시작되기 전에 반복 횟수를 모를 때 사용

```swift
while condition {
  // 실행한다
}
```

### Repeat-While

* 코드를 최초 1회 실행한 후 조건이 `false`일 때 까지 반복

```swift
repeat {
  // 실행한다 
}
while condition
```

## Contril Transfer

* 특정 코드에서 다른 코드로 제어를 이전? 하여 실행 흐름을 변경
* `continue` : 반복문 `continue`아래 코드는 실행하지 않고 바로 다음 반복흐름으로 넘어감
* `break`: `switch`, `loop`등 특정 statement의 실행블럭 `{ }`실행 흐름을 중단하고 블럭 밖으로 빠져나감
* `fallthrough` : `switch 에서 바로 아래 `case` 로 실행 흐름이 넘어감
* `return`: 함수에서 값을 반환하며 함수를 종료, 반환 값이 없으면 `return`만 작성하여 반환 값 없이 함수를 종료
* `throw`: `do-try-catch`에서 예외처리를 할 때 예외 상황에서 `thow`를 통해 `do`의 실행 흐름을 `catch`로 이동시킴

### Labeled Statements

* `for`문 앞에 이름을 붙여서 특정 loop에 대해 control할 수 있음
* Inner 안에 for문이 다 돌고 나서야 Outer에 for문이 실해 되는 것이다

```swift
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
```

