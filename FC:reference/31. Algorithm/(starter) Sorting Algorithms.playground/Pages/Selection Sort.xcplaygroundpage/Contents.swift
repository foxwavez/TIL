//: [Previous](@previous)
/*:
 ---
 # Selection Sort (선택 정렬)
 ---
 */

var inputCases = [
  [],
  [1],
  [1, 2, 3, 5, 6, 7, 9, 10, 14],
  [1, 1, 2, 2, 3, 3, 1, 2, 3],
  [14, 10, 9, 7, 6, 5, 3, 2, 1],
  [5, 6, 1, 3, 10, 2, 7, 14, 9],
  Array(1...10).map { _ in Int.random(in: 1...999) },
]

/*:
 ---
 ### 정렬 함수 구현
 ---
 */
//  0  1  2  3  4   5
// [5, 6, 1, 3, 10, 2, 7, 14, 9] // 처음
// [1, 6, 5, 3, 10, 2, 7, 14, 9] // 1회차
// [1, 2][5, 3, `0, 6, 7, 14, 9] // 2회차

// n^2- 버블, 삽입, 선택 정렬
// n log n - 빠른, 합병, 힙 정렬

func selectionSort(input: inout [Int]) {
    for i in input.indices { // indices는 index의 복수형 0...input.count 와 동일하다
        var minIndex = i
        for idx in (i + i)..<input.count {
            guard input[minIndex] > input[idx] else { continue }
            minIndex = idx
        }
        input.swapAt(i, minIndex)
    }
}


/*:
---
### 결과 확인
---
*/
// 정답지 - 기본 정렬 함수
let sorted = inputCases.map { $0.sorted() }

// 직접 만든 정렬 함수 적용
for idx in inputCases.indices {
  selectionSort(input: &inputCases[idx])
}

// 결과 비교. 정렬 완료가 나오면 성공
func testCases() {
  inputCases.enumerated().forEach { idx, arr in
    guard sorted[idx] != arr else { return }
    print("케이스 \(idx + 1) 정렬 실패 - \(inputCases[idx])")
  }
}
let isSuccess = sorted == inputCases
isSuccess ? print("정렬 완료") : testCases()

//: [Next](@next)