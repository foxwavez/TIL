//: [Previous](@previous)
import Foundation
/*:
 # UserDefaults
 - iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나
 - 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장
 */


// Memory
var inMemory = 10
inMemory
/*:
 ---
 ### Question
 - 메모리와 파일로 저장하는 형태의 차이점은?
 ---
 */
// A. 메모리는 앱이 꺼지면 저장되어 있던 정보가 사라진다.
// 앱이 꺼지더라도 데이터를 저장하고 싶으면 파일에 저장하거나, 서버에 저장해야 한다.


// UserDefaults 는 일반적으로 싱글톤 형태로 사용
let newUserDefaults = UserDefaults() // 이런 형태는 거의 안 쓴다고 보면 된다
let singletonUserDefaults = UserDefaults.standard


UserDefaults.standard.set(10, forKey: "Ten")
UserDefaults.standard.integer(forKey: "Ten") // 가져오는 방법은 이렇게 사용하면 된다.

UserDefaults.standard.set(Double.pi, forKey: "Double Pi")
UserDefaults.standard.double(forKey: "Double Pi")

UserDefaults.standard.set(true, forKey: "True")
UserDefaults.standard.bool(forKey: "True")

let date = Date()
UserDefaults.standard.set(date, forKey: "Date")
UserDefaults.standard.object(forKey: "Date")

//Q. 저장하지 않은 키를 불러올 때 결과는?
UserDefaults.standard.integer(forKey: "WrongKey") // 0 -> standard.intege에 옵션을 누른 상태로 커서를 가져다 대먄 타입을 알수 있다
UserDefaults.standard.bool(forKey: "WrongKey")    // false -> 그걸로 값이 나오는 걸 유추 할 수 있다.
UserDefaults.standard.object(forKey: "WrongKey")  // nil



let userDefaults = UserDefaults.standard
print(userDefaults)

print("\n---------- [ dictionaryRepresentation ] ----------\n")
//print(userDefaults.dictionaryRepresentation())

print("\n---------- [ keys ] ----------\n")
//print(Array(UserDefaults.standard.dictionaryRepresentation().keys))

print("\n---------- [ values ] ----------\n")
//print(Array(UserDefaults.standard.dictionaryRepresentation().values))

// 요즘에는 codable 이라는 방식으로 사용하는데 이건 4개월차 네트워크 할 때 알려줄 예정
// 궁금한 사람은 swift codabel 검색해서 알아보기 바람
//: [Next](@next)
