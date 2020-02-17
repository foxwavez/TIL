//: [Previous](@previous)
//: # Parsing JSON
import Foundation

/*:
 ---
 ## Basic
 ---
 */

let jsonData1 = """
{
  "greeting": "hello world",
  "foo": "bar",
  "iOS": "Swift"
}
""".data(using: .utf8)!

if let json = try? JSONSerialization.jsonObject(with: jsonData1) as? [String: String],
  let greeting = json["greeting"],
  let foo = json["foo"],
  let iOS = json["iOS"] {
  print("\n---------- [ JSON Parsing (1) ] ----------\n")
  print(greeting)
  print(foo)
  print(iOS)
}


let jsonData2 = """
{
  "greeting": "hello world",
  "iOS": true,
  "SwiftVersion": 5
}
""".data(using: .utf8)!

if let json = try? JSONSerialization.jsonObject(with: jsonData2) as? [String: Any],
  let greeting = json["greeting"] as? String,
  let iOS = json["iOS"] as? Bool,
  let version = json["SwiftVersion"] as? Int {
  print("\n---------- [ JSON Parsing (2) ] ----------\n")
  print(greeting)
  print(iOS)
  print(version)
}


let jsonData3 = """
[
  {
     "postId": 1,
     "id": 1,
     "name": "id labore ex et quam laborum",
     "email": "Eliseo@gardner.biz",
     "body": "laudantium enim quasi est quidem magnam voluptate"
},
  {
    "postId": 2,
    "id": 2,
    "name": "quo vero vero reiciendis velit similique earum",
    "email": "JayneKuhic@sydney.com",
    "body": "est natus enim nihil est dolore omnis"
  }
]
""".data(using: .utf8)!

if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonData3) as? [[String: Any]] {
  print("\n---------- [ JSON Parsing (3) ] ----------\n")
  for json in jsonObjects {
    if let postId = json["postId"] as? Int,
      let id = json["id"] as? Int,
      let name = json["name"] as? String,
      let email = json["email"] as? String,
      let body = json["body"] as? String {
      print(postId, id, name, email, body)
    }
  }
}





/*
 [ 실습 ]
 아래 URL로부터 얻은 JSON 데이터를 파싱하고
 Astronaut 타입을 만든 뒤 파싱 데이터를 통해 Astronaut 객체를 생성하여 출력
 */
struct Astronsuts {
    var name: String
    var craft: String
}

print("\n---------- [ Practice ] ----------\n")

// http://open-notify.org/Open-Notify-API/

let astronauts = "http://api.open-notify.org/astros.json"  // 우주비행사 정보
let apiURL = URL(string: astronauts)!
print(apiURL)
let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
  guard error == nil else { return print(error!) }
  guard let response = response as? HTTPURLResponse,
    (200..<400).contains(response.statusCode)
    else { return print("Invalid response") }

  guard let data = data else { return }

     // 코드 구현
    if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        let people = json["people"] as? [[String: String]] {
        for person in people {
            guard let name = person["name"] else { return }
            guard let craft = person["craft"] else { return }
            print(Astronsuts.init(name: name, craft: craft))
        }
    }
}
dataTask.resume()






//guard let jsonData = try String(contentsOf: apiURL).data(using: .utf8) else { return }









/*:
 ---
 ### Answer
 ---
 */
/*
 struct Astronaut {
   let craft: String
   let name: String
 }
 */

/*
 guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
 print("jsonObject :", jsonObject)
 
 guard (jsonObject["message"] as? String) == "success",
   let people = jsonObject["people"] as? [[String: String]],
   let peopleCount = jsonObject["number"] as? Int
   else { return print("Parsing Error") }
 
 print("\n---------- [ Parsing Success ] ----------\n")
 print("총 \(peopleCount)명의 우주비행사가 탑승 중입니다.")
 
 print("= 우주비행사 명단 =")
 people
   .compactMap {
     if let craft = $0["craft"], let name = $0["name"] {
       return Astronaut(craft: craft, name: name)
     }
     return nil
 }
 .forEach { print($0) }
 */

//: [Next](@next)

