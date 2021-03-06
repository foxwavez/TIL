//: [Previous](@previous)
import UIKit

/***************************************************
 1. Array, Set, Dictionary 의 차이점에 대해 설명하고 예시 코드 작성
 ***************************************************/

// Array = 배열, 인덱스가 있다. 차례대로 순서가 있다. 아이템이 중복되어도 된다
let a = [1,2,3,4,4,4,5]
// Set = 집합, 아이템이 중복되지 않아야 한다. 순서가 없다.
let b: Set = [0,1,2,3,4]
// Dictionary = key와 value가 있다. 내가 접근하는 키가 없을 수도 있어 옵셔널을 반환하기도 한다.
let c = ["Korea":"seoul", "Japan": "tokyo", "Spain": "madirid"]
 

/***************************************************
 2. Value Type, Reference Type 에 대한 예시와 그 차이점에 대해 설명
 ***************************************************/



/***************************************************
 3. Application의 LifeCycle의 각 상태에 대해 설명
 ***************************************************/



/***************************************************
 4. ViewController LifeCycle의 각 상태에 대해 설명
 ***************************************************/

// didroad -> 로드 된 후
// willAppear -> 화면에 나타나기 전
// didAppear -> 화면에 나타난 후
// willDisappear -> 화면에 사라지기 전
// didDisappear -> 화면에 사라진 후

/***************************************************
 5. 다음 4개의 키워드 (continue, break, return, fallthrough)가 쓰이는 위치와 역할에 대해 각각 설명
 ***************************************************/

// countinue: 반복문에서 ture라면 밑에 있는 코드를 실행하지 않고 위로 돌아가 반복문을 실행한다
// break: 반복문에서 계속 실행되는 것을 멈출 때 쓰인다. 멈추고 싶은 위치에 작성한다.
// return: 함수에서 리턴이 나오면 함수의 기능에서 값을 반환하고 함수를 멈춘다. 함수에 맨 마지막에 있다
// fallthrough: 반복문에서 실행하고 값이 true라 멈출 때 fallthrough를 사용해 계속 실행하게 한다. statement code 맨 아래 있다

/***************************************************
 6. Init 메서드가 필요한 경우와 그렇지 않은 경우의 차이점에 대해 설명
 ***************************************************/

// init 메소드는 클래스에서 파라미터 값이나 타입이 클래스를 실행 할 때마다 바꾸고 싶을때 사용한다.(초기화)
// 클래스 안에서 프로퍼티를 디폴트값으로 주고 싶을 때는 따로 init 메소드를 사용하지 않는다


/***************************************************
 7. Access Level 을 각 단계별로 나열하고 그 차이점에 대해 설명
 ***************************************************/



/***************************************************
 8. OOP 4대 특성에 대해 나열하고 각 특성에 대해 아는 만큼 설명 및 예시 코드 작성
 ***************************************************/

// 다형성: 클래스 실행 할 때 파라미터 값을 다르게 줄 때마다 다른 결과가 나와 다형성
// 추상화: 불필요한 것은 빼 버리고 필요한 것만 남기는 것
// 캡슐화 (은닉화): 클래스로 감싸는 것
// ?


/***************************************************
 9. Frame 과 Bounds가 무엇이고, 둘의 차이점은 어떤 것이 있는지 설명
 ***************************************************/

// frame은 x좌표 y좌표가 0.0 기준인 상태
// Bounds는 기준이 묶여있는 오브젝트에 기준인 상태


/***************************************************
 위 개념들은 아직 익숙치 않아서 답변하지 못한 분들이 많을 수 있지만
 중요한 내용들이니 답하지 못한 질문들은 체크해두었다가 천천히 공부하세요.
 ***************************************************/


//: [Next](@next)
