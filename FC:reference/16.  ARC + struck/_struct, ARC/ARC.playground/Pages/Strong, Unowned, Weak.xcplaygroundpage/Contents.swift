//: [Previous](@previous)
//: - - -
//: # Strong, Unowned, Weak
//: - - -

class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
//  let teacher: Teacher // count 2
//  unowned let teacher: Teacher // count 1
  weak var teacher: Teacher? // 옵셔널이다. count 1
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher() // count 1
var student: Student? = Student(teacher: teacher!)  // student count 1
teacher?.student = student // student count 2


print("\n---------- [ teacher release ] ----------\n")
teacher = nil // count 0  // student count 1

print("\n---------- [ student release ] ----------\n")
student = nil // count 0   // student coutn 0





/***************************************************
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
 ***************************************************/


//: [Next](@next)
