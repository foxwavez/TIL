//: [Previous](@previous)
import Foundation
/*:
 ---
 # NSError
 ---
 */
// NSError는 오브젝트씨에서부터 사용하던것, class 이다.

func throwNSError() throws {
  // NSError() - 기본 생성자 (X),  Domain cannot be nil
  throw NSError(domain: "Domain error string", code: 99, userInfo: ["MyKey": "MyValue"])
}

func throwsNSErrorExample() {
  do {
    try throwNSError() // 에러가 발생할 때 실행
  } catch {
    print("Error :", error)
    
    let e = error as NSError
    print("NSError :", e)
    print("domain :", e.domain)
    print("code :", e.code)
    print("userInfo :", e.userInfo)
  }
}

throwsNSErrorExample()


//: [Next](@next)
