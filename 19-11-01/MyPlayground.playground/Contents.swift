

/* 1) var 와 let의 차이점에 대해 서술하고 그 예제 코드 작성
        
      -> 차이점에 대해 서술
      var = Variables 나중에 변경이 가능한 변수 var
      let = Constants 나중에 변경이 불가능한 상수 let */
   
      let number1: Int = 10
      number1 = 10
//  에러가 난다
 
      var number2: Int = 20
      number2 = 40


     /*  반복문(Loop)의 종류와 1~10까지 출력하는 코드 작성
 
      -> 반복(Loop)의 종류
      1. for문 -> for i in...10
      2. while문 -> while 조건문 { }
 
     -> 1~10까지 출력하는 코드 작성 */
     for i in 1...10 {
       print(i)
     }
 
    var i: Int = 0
    while(i<10) {
      i = i+1
      print(i)
    }
     
 


// 3) 타입 추론(Type Inference)이란?
// -> 타입을 지정하지 않아도 컴파일러가 코드를 읽고 타입을 유추해서 컴파일하는 것

// 4) 논리연산자(Boolean Logic) 인 AND(&&) 와 OR(||) 로 나올 수 있는 경우의 수 4가지
/* -> AND (&&)
      true && true -> true
      true && false -> false
      false && true -> false
      false && false -> false
 
   -> OR (||)
     true || true -> true
     true || false -> true
     false || true -> true
     false || false -> false
 */

