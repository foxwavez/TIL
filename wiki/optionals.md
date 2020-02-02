# optionals 

* 값이 0인것(empty)와 값이 없는(valueless)

* `0` 이라는 데이터가 있는 것과 데이터 자체가 없는 것의 차이

* 값이 없을 수 있는 상황에서 사용

* 값을 전혀 갖고 있지 않음 `nil` 도는 값이 있고 그 값에 접근 하기 위해 `optional()`을 벗겨내서 사용

  ```swift
  public enum Otuional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
  }
  ```

  ## Optional Type

  * `Optional<Type>`또는 `Type?`옵셔널 타입을 표현

  ```swift
  var vlaueL Int? = 0
  var value: optional<Int> = nil // value: nil
  ```

  * 문자열을 정수로 바꿀 때, 숫자로 된 문자열은 변환 가능하지만 숫자가 아닌 문자는 불가능
  * 변환에 실패하면 변환할 수 없다는 의미로 `nil`반환
  * 변환에 성공하면 값을 Òptional() 로 감싸서 반환

  ```swift
  let intStr = "123"
  let someStr = "abc"
  let convertedInt1 = Int(intStr) // Optional(123)
  let convertedInt2 = Int(someStr) //   nil
  ```

  * Swift에서 `nil은 optional인 모든 타입에 할당할 수 있다. 즉, Optional type이 아니면 `nil을 넣을 수 없다.

  ```swift
  // errorL: Int, Double 등 어떤 타입인지 명확하지 않기 때문에 타입 추론 불가
  let nonOptional = nil
  // error: Int type은 optional type이 아니므로 nil 할당 
  let nonOptiona: Int = nil
  // 일반 값을 optional 변수에 할당 가능/ 해당 값은 Optional(value)로 사용됨
  let optionalValue: Int? = 10
  // error: 역으로 optional을 일반 변수에 할당할 수 없다.
  let nonOptional = optionalValue
  ```

## Unwapping Optional

* 직접 비교

```swift
if optionalValur != nil {
  print("Value isn't nil")
} else {
  print ("Value is nil")
}
```

* Optionall Bindding: `nil` 체크와 동시에 unwapping한 값을 가져오는 방법
* `let`으로 bindig하면 변경 불가. `var`로 binding하면 값 변경 가능
* Optional binding 과 bollean 조건식을 함께 쓸 수 있음. Optional binding을 통해 값을 할당할 때 unwrapping에 성공해서 값을 할당하면 내부적으로 `true` 를 반환하므로 boolean 연산 가능

```swift
// If let: optioanalValur가 nil이 아닐 경우 value에 unwrapping한 값을 담아서 if block 실행. nil이면 else block 실행
if ler value == optionalValue {
  print("Valur is not nil:\(value)")
} else {
  print("Value is nil")
} 

// While let: optinalValue가 nil이 아닐 경우에 value에 unwrapping한 값을 담아서 loop 실행
while let value = optionalValue {
  
}

// Guard let: optionalValue가 nil이 아닌 경우 value에 unwrapping 값을 담아서 다음 코드 진행
guard let value = optionalValue else { return }
```

* Forced Unwrapping: Unwrapping 연산자 `!` 붙이면 optional 값을 강제 unwrapping
* `nil`인 상태에서 강제 unwrapping 하려고 하면 오류가 발생하므로 `nil`이 아님이 확실하면 경우에만 사용하는 것이 좋다

```swift
var optionalValue: Int? = 10
optionalValue // Optinal(10)
optionalValu! // 10
var optionalValue2: Int = nil
optioanlvalue2! // error nil을 unwrapping 할 수 없음
```

## IUO(Implicity Inwrapped Optionals, 암묵적 옵셔널 해제)

* Optioanl type이지만 향후 `nil`이 될 가능성이 없음을 확신할 수 있을 때 사용(프로퍼티 지연 초기화 등)
* `nil` check를 해야 할 때는 IUO 대신 일반 optional type을 사용해야함
* IUO를 사용하면 non-optional type과 연산할때 unwapping 연산자 `!` 사용하지 않아도 된다.
* 그 자체로는 optional type이기 때문에 값을 꺼내쓰려면 `!` 연산자를 사용해야햠

```swift
let optionalString1: String? = "Normal Optional String"
let optionalString2: String! = "IUO String"
type(of: optialString1) //Optial<String>.Type
type(of: optionalString2) //Optional<String>.type
print(optionalString1)		// Optional("Normal Optional String")
print(optionalString2)		// Optional("IUO String")

// 일반 optional은 unwrapping해야 일반 타입에 할당 가능
let nonOptionalString1: String = optionalString1!
// IUO는 ! 연산자 없이도 일반 타입에 할당 가능
let nonOPtionalString2: string = optionalString2
```

## Nil-coalescingOperator

* 결과가 `nil`일 경우 기본값을 제공하는 역할. `nil`이 아니면  unwrapping

```swift
let optionalValue: String? = nil
let result: String = optionalValue ?? "This value is nil"
print(result) // This value is nil
```

* 3항 연산자( `condition ? true : false`)는 `condtion`의 결과가 `ture` 또는 `false`에 따라 다른 결과를 반환하는 것
* `value ?? default` 연산자 optional에서만 사용할 수 있는 것으로 `value`가 `nil`일 때 `defalut를 반환하는 것

```swift
// nil-coalescing operatir를 사용할 때
let result = optiovalValue ?? "This value is nil"
// 3항 연산자를 사용할 때
let result = optionalValue != nil ? optionalValue! : "This value is nil"
```

## Optional Chaning

* `?`을 이용해서 연쇄적으로 값에 접근 가능
* `greeting["John"]?`이 nil이면 뒤에 붙인 함수들은 실행되지 않고 곧바로  `nil` 반환

```swift
print(greeting["John"])?.lowrcased.uppercased())
```

## Example

```swift
/*
 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
 func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
 */

func calculateModulo(op1: Int, op2:Int2) -> Int? {
  
  // 1.binding(if let)을 이용하는 방법
  if let op2 = op2, op2 != 0 {
    return op1 % op2
} else {
    return nil
  }
  
  // 2. binding(guard let)을 이용하는 방법
  guard let op2 = op2, op2 != 0 else 
{ return nil }
  op1 % op2
  
  // 3. nil-coaleccing과 3항 연산자를 이용하는 방법
  let result = (op2 ?? 0), op2 != 0 ? op1 % op2 : nil
}
calculateModulo(op1: 10, op2: nil)
```

