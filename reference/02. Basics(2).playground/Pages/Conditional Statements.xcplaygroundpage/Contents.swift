//: [Previous](@previous)
/*:
 # Conditional Statements
 */

/*:
 ---
 ## if Statements
 ---
 */
/*
 if <#condition#> {
   <#code#>
 }
 
 if <#condition#> {
   <#statements#>
 } else {
   <#statements#>
 }
 
 - condition 은 Bool 값 (true, false)
 */

// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}



// true && true = true
// true && false = false

// Logical And Operator
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0) {
}

// Logical And Operator
if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0 { // ,콤마를 사용하여 &&과 동일한 기능
}

// Logical Or Operator
if temperatureInFahrenheit > 0 || temperatureInFahrenheit % 2 == 0 {
}

/*:
 ---
 ### Question
 - if ~ else if   /  if 문을 2개 하는 것과 차이점?
 - if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
 ---
 */
// else if문을 하게 된다면 앞에 if문이 조건이 성립되었을 때 else if문이 실행되지 않는다. 하지만 if문 두개라면 첫번째 if문이 실행 되더라도 두 번째 if문 까지 실행 되어버린다.

var a = 1


if a < 10{
    // some code
} else if a < 20 {
} else if a < 30 {
} else if a < 40 {
} else if a < 50 {
} else if a < 60 {
} else {
}



// if ~ else if   /  if 문을 2개 하는 것과 차이점?

var number = 9
if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} // if 문의 컨디션이 충족되었을 때 else if문이 실행되지 않는다.

if number < 10 {
  print("10보다 작다")
}
if number < 20 {
  print("20보다 작다") // if if 인 경우 첫번째 if문의 컨디션이 충족이 되어도 아래의 있는 if문 또한 실행이 된다.
}



// if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
number = 25

if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else {
  print("20과 같거나 크다")
}


if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else if number >= 20 {
  print("20과 같거나 크다")
}




/*:
 ---
 ## switch Statements
 ---
 */
//스위치문은 스위프트에서 많이 사용하는 문법!
/*
 switch <#value#> {
 case <#value 1#>:
     <#respond to value 1#>
 case <#value 2#>,
      <#value 3#>:
     <#respond to value 2 or 3#>
 default:
     <#otherwise, do something else#>
 }
 // default는 if문의 else와 비슷한 것
 
 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 
 */

print("\n---------- [ switch statements ] ----------\n")

let alphabet: Character = "a"

switch alphabet {
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  break
//  print("Some other character")
}


if alphabet == "a" {
    
} else if alphabet == "z" {
    
} else {
    
}




// Without default case

let isTrue = true
type(of: isTrue)

switch isTrue {
case true:
  print("true")
case false:
  print("false")
}
//case가 true false 인 경우 default가 필요없다 그 외의 경우가 없기 때문이다.


// Interval Matching

print("\n---------- [ Interval Matching ] ----------\n")

let approximateCount = 30

switch approximateCount {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}


/*:
 ---
 ### Question
 - 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
 ---
 */
// 하단 Answer 참고


 if temperatureInFahrenheit <= 32 {
 print("It's very cold. Consider wearing a scarf.")
 } else if temperatureInFahrenheit >= 86 {
 print("It's really warm. Don't forget to wear sunscreen.")
 } else {
 print("It's not that cold. Wear a t-shirt.")
 }
 


temperatureInFahrenheit = 32
 
switch temperatureInFahrenheit {
case temperatureInFahrenheit where temperatureInFahrenheit <= 32:
    print("It's very cold. Consider wearing a scarf.")
case temperatureInFahrenheit where temperatureInFahrenheit >= 86:
    print("It's really warm. Don't forget to wear sunscreen.")
default:
    print("It's not that cold. Wear a t-shirt.")
}




// Compound Cases

// if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산

let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}



// value binding

// x, y 좌표
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}


// where clause

let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y: // where은 만약에 라는 느낌
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}

/*:
 ---
 ### Question
 - 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
 ---
 */
// 하단 Answer 참고


let oddEven = 12
switch oddEven {
case oddEven where oddEven % 2 == 0:
    print("\(oddEven)는 짝수입니다.")
default:
    print("\(oddEven)는 홀수입니다.")
}

func oddEven2(number: Int) {
    switch number {
    case number where number % 2 == 0:
        print("\(number)는 짝수입니다.")
    default:
        print("\(number)는 홀수입니다.")
    }
}
oddEven2(number: 12)


// x.isMultiple 이라는 함수를 사용하면 짝수인지 홀수인지 확인해준다.


// fallthrough

print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also" //소수일 때만 출력된다.
  fallthrough // fallthrough를 사용하면 밑에 것까지 실행이 된다. 실행이 되었으면 하는 부분의 밑에 작성해준다.
default:
  description += " an integer."
}
print(description)



/*:
 ---
 ## Early Exit
 - guard statement
 ---
 */
/*
 if <#condition#> {
 <#code#>
 } else if <#condition#> {
 <#code#>
 }
 - 특정 조건을 만족하면 해당 분기문 실행
 
 guard <#condition#> else {
 <#code#>
 }
 - 조건에 맞지 않으면 바로 종료.
 - 들여쓰기 중첩 방지
 */

func update(age: Int) {
  if 1...100 ~= age {
    print("Update")
  }
}

//func update(age: Int) {
//  switch age {
//  case 1...100: print("Update")
//  default: break
//  }
//}

//func update(age: Int) {
//  guard 1...100 ~= age else { return }
//  print("Update")
//}

update(age: -1)
update(age: 2)
update(age: 100)



func someFunction() {
  // ...
  // ...
  
  // if 문의 조건이 맞으면 어떤 코드를 수행할 것
  if Bool.random() {
    // ...
  }

  // gaurd문의 조건을 만족할 때만 다음으로 넘어갈 것
  guard Bool.random() else { return }
  
  // ...
  // ...
}
 
// 조건을 만족하지 않으면 빠르게 나오게 된다.



/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

// if - else if - else 문을 switch 문으로 바꿔보세요.
switch temperatureInFahrenheit {
case ...32: // 32 이하
  print("It's very cold. Consider wearing a scarf.")
case 86...:
  print("It's really warm. Don't forget to wear sunscreen.")
default:
  print("It's not that cold. Wear a t-shirt.")
}



// 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
let even = 4
switch even {
case let x where x.isMultiple(of: 2):
  print("\(x)는 짝수")
default:
  print("홀수")
}


//: [Next](@next)
