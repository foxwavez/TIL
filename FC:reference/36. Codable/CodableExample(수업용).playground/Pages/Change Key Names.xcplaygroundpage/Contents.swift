//: [Previous](@previous)
import Foundation

let jsonData = """
{
  "user_name": "James",
  "user_email": "abc@xyz.com",
  "gender": "male",
}
""".data(using: .utf8)!


struct User: Decodable {
  let name: String
  let email: String
  let gender: String
  
  private enum CodingKeys: String, CodingKey {
    //Struct에 프로퍼티 이름과 jsonData의 프로퍼티 이름이 달라서 코딩키를 해줘야 한다(맞춰줘야)
    // _언더바를 사용해 이름을 지어주는 컨벤션은 스위프트와 맞지 않다
    case name = "user_name"
    case email = "user_email"
    case gender
  }
}


let decoder = JSONDecoder()
do {
    let user = try decoder.decode(User.self, from: jsonData)
    print(user)
} catch {
    print(error)
}



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
