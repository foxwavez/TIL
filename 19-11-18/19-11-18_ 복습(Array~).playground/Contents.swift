// Literal type. value으 type으로 array의 type 추론
let arr1 = [1, 2, 3]


// Type Annotation
let arr2: [Int] = [1, 2, 3]
let arr3: Array<Int> = [1, 2, 3]

//Type Inference
let arr4 = [Int]() // [] empty Int array
let arr5 = Array<Int>(repeating: 1, count: 3) // [1, 1, 1]

var arr = [1, 2, 3, 4, 5]
arr.remove(at: 3) // index 3에 있는 값을 삭제하고 삭제한 값을 반환
// arr: [1, 2, 3, 5]
arr.removeAll()  // 모든 item을 삭제. 빈 배열이 된다
// arr: []
arr.removeFirst()// 가장 앞 item을 삭제하고 그 값을 반화
// [2, 3, 4, 5]
arr.removeLast() // 가장 뒤 item을 삭제하고 그 값을 반환
// arr: [1, 2, 3, 4]

