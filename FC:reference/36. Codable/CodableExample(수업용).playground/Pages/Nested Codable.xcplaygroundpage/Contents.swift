//: # Nested Codable
import Foundation

let jsonData = """
{
  "message": "success",
  "number": 3,
  "people": [
    { "craft": "ISS", "name": "Anton Shkaplerov" },
    { "craft": "ISS", "name": "Scott Tingle" },
    { "craft": "ISS", "name": "Norishige Kanai" },
  ]
}
""".data(using: .utf8)!

// 안에 들어있는 것을 한꺼번에 파싱
struct Astronauts: Decodable {
  let message: String
  let number: Int
    let people: [Person]
    // let people: [[String: String]] 이렇게 작성하면 따로 jsonData에거 people 부분을 구현 해야한다
  
  struct Person: Decodable {
    let name: String
  }
}

do {
  let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonData)
  print(astronauts.message)
  print(astronauts.number)
  astronauts.people.forEach { print($0)}
} catch {
  print(error.localizedDescription)
}



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
