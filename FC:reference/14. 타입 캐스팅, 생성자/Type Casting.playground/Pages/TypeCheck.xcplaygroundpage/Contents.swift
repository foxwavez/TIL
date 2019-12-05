//: [Previous](@previous)
/*:
 # Type Check
 */

/*:
 ---
 ## 타입 확인 - type(of: )
 ---
 */
print("\n---------- [ type(of:) ] ----------\n")

type(of: 1)
type(of: 2.0)
type(of: "3")


// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])


// Generic -> 이런 게 있다 하고 넘어가면 된다
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)
printGenericInfo(2.0)
printGenericInfo("3")



/*:
 ---
 ## 타입 비교 - is
 ---
 */
print("\n---------- [ is ] ----------\n")

/***************************************************
 객체 is 객체의 타입 -> Bool (true or false)
 ***************************************************/

let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교
//number is Double // 에러가 난다 타입이 다르기 때문에


let strArr = ["A", "B", "C"]

if strArr[0] is String {
  "String"
} else {
  "Something else"
}

if strArr[0] is Int {
  "Int"
}


let someAnyArr: [Any] = [1, 2.0, "3"]

for data in someAnyArr {
    if data is Int { // is 를 사용해서 타입을 비교하고 Bool 값을 반환 할 수 있다.
    print("Int type data :", data)
  } else if data is Double {
    print("Double type data : ", data)
  } else {
    print("String type data : ", data)
  }
}



/*:
 ---
 ## 상속 관계
 ---
 */
print("\n---------- [ Subclassing ] ----------\n")

class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}

let student = Student()
student is Human // always true -> student는 Human의 자식 클래스라 상속 받아서
student is Baby // always fails -> false
student is Student // always true -> 클래스가 서로 같긴 때문에

let univStudent = UniversityStudent()
student is UniversityStudent //
univStudent is Student // always true


/***************************************************
 자식 클래스 is 부모 클래스  -> true
 부모 클래스 is 자식 클래스  -> false
 ***************************************************/


let babyArr = [Baby()]
type(of: babyArr) //[baby] Array<baby>


// Q. 그럼 다음 someArr 의 Type 은?

let someArr = [Human(), Baby(), UniversityStudent()]
type(of: someArr) // 수퍼클래스가 Human 이기 때문에 Array<Human> 이 나온다


someArr[0] is Human    // true -> Human Array 타입이기 때문에
someArr[0] is Student  // false
someArr[0] is UniversityStudent  // false
someArr[0] is Baby     // false
//
someArr[1] is Human    // true -> Baby()를 가지고 타입을 확인 / Baby()의 수퍼 클래스는 Human
someArr[1] is Student  // false
someArr[1] is UniversityStudent  // false
someArr[1] is Baby     // ture ->
//
someArr[2] is Human    // true -> UniversityStudent를 가지고 타입을 확인 / 수퍼수퍼클래스가 human
someArr[2] is Student  // true -> 수퍼클래스가 Student
someArr[2] is UniversityStudent  // true -> niversityStudent를 가지고 타입을 확인 / 본인의 타입이라
someArr[2] is Baby     // false


var human: Human = Student() // var human = Human() 한것과 동일하다.
type(of: human) // Human, Student
// 해당 변수의 타입 vs 실제 데이터의 타입 student

// 정적 - 컴파일 타임 - 변수에 정해진 타입 ->  let abc: Int = 4
// 동적 - 런타임 - 실제 들어있는 값타입, 컴파일이 끝나고 실행할 때 -> var rtc: String = abc -> rtc는 스트링 타입이지만 실행 하면 abc의 값 4가 나온다

// Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
human.name    // "name"
//human.school  // 에러가 난다 Human에 프러퍼티는 name 밖에 없기 때문

if let a = human as? Student { // 동적이라 현재 변수 타입(Human)은 타입캐스팅을 해서 실제 값(Student)에 접근할 수 있다
    a.school
}

// Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
human = Baby() // Baby -> 서로 형제 클래스이기 때문에
type(of: human)
human = UniversityStudent() // 부모 클래스에 자식 클래스를 집어넣는 것은 가능하다


var james = Student() // Student 타입으로 정해짐
james = UniversityStudent() // 정적 - Student, 동적 - UnivStudent

//james = Baby()    // 에러

// Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가
//james.name     // Human 속성 -> true
//james.age      // Baby 속성
//james.school   // Student 속성
//james.univName // UniversityStudent 속성

// james.univName // universityStudent 속성 // 불가
//james.age      // Baby 속성  // 불가


// Q. 그럼 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요
// A. 타입 캐스팅을 해서 univName에 접근하게 하면 된다
if let james2 = james as? UniversityStudent {
    james2.univName
}

// 타입 캐스팅
// presenting, segue.destination as? SecondViewController UIViewController



//: [Next](@next)
