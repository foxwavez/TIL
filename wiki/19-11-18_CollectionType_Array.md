# Collection Type

* swift
  * Array: ordered collections for values
  * Dictionary: unordered collections of key-value associations
  * Set: unordered collections of unique values
* Object-C(Foundation framework)
  * NSArray, NSMutableArray
  * NSDictionary, NSmutableDictionary
  * NSSet, NSmutableSet

## Array

* Ordered collection
* Zero-based integer index
* `var`: mutable `let`: immutable

### type

```swift
// Literal type. value으 type으로 array의 type 추론
let arr1 = [1, 2, 3]
let emptyArray = [] // 타입을 추론할 수 없으므로 error -> [""] String 인걸 알려주면 에러가 사라진다

// Type Annotation
let arr2: [Int] = [1, 2, 3]
let arr3: Array<Int> = [1, 2, 3]

//Type Inference
let arr4 = [Int]() // [] empty Int array
let arr5 = Array<Int>(repeating: 1, count: 3) // [1, 1, 1]
```

### Usage

* array[index] 로 배열의 원소에 접근하거나 값 변경 가능. Array의 index를 벗어나서 접근하면 오류

```swift
var arr = [1, 2, 3]
arr[2]         // 3
arr[1] = 3     //[3, 2,3]
arr[3]         // index를 벗어나서 오류
```

* `append(_):` value를 배열 뒤에 이어붙임

```swift
var arr = [Int]()
arr.append(1) 
arr += [2]  //literal을 연산자를 통해 추가
// [1, 2]
```

* `insert(_:, at:)`: value를 `at`에 해당하는 index에 넣음. `at` 부터 뒤에 있는 item들을 뒤로 밀고 그 자리에 새로운 값을 삽입

```swift
var arr = [1, 2, 3]
arr.insert(4, at:2)
// [1, 2, 4, 3]
```

* `array[a...b]` 처럼 범위 연산자로 배열에서 여러 개의 값을 뽑아서 또 다른 배열 생성

```swift
var arr = [1, 2, 3, 4, 5]
arr[2...]   // [3, 4, 5]  2번째 배열 엘리먼트 ~ 끝에 있는 배열 엘리먼트 까지
arr[...2]   // [1, 2, 3]  0번째 배열 엘리먼트 ~ 2번째 배열 엘리먼트 까지
arr[2...] = [5, 6]
arr         // index 2 이상 값을 지우고 새로운 값으로 대체: [1, 2, 5, 6]
```

* `remove()` : 배열에 iteml을 삭제

```swift
var arr = [1, 2, 3, 4, 5]
arr.remove(at: 3) // index 3에 있는 값을 삭제하고 삭제한 값을 반환
// arr: [1, 2, 3, 5]
arr.removeAll()  // 모든 item을 삭제. 빈 배열이 된다
// arr: []
arr.removeFirst()// 가장 앞 item을 삭제하고 그 값을 반화
// [2, 3, 4, 5]
arr.removeLast() // 가장 뒤 item을 삭제하고 그 값을 반환
// arr: [1, 2, 3, 4]
```

### sort

* shuffle() : 현재 array를 직접 섞음
* shuffled() : 현재 array 섞은 결과를 반환. 현재 array는 변하지 않음

```swift

```