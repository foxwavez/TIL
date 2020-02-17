//: [Previous](@previous)
import Foundation


/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 
 {
    "timestamp": 1581927765,
    "iss_position":
        {
            "latitude": "39.8631",
            "longitude": "92.4866"
        },
    "message": "success"
 }
 
 */



func practice1() {
  let issInfo = "http://api.open-notify.org/iss-now.json"
  let apiURL = URL(string: issInfo)!
  let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            (200..<400).contains(response.statusCode)
            else { return print("Invailid response") }
        guard let data = data else { return }
        
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let _ = json["timestamp"] as? Int,
            let iss_position = json["iss_position"] as? [String: String] {
            print(iss_position)
            }
    }
    dataTask.resume()
}
practice1()


/*
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */

let jsonString2 = """
{
  "users": [
    {
      "id": 1,
      "first_name": "Robert",
      "last_name": "Schwartz",
      "email": "rob23@gmail.com"
    },
    {
      "id": 2,
      "first_name": "Lucy",
      "last_name": "Ballmer",
      "email": "lucyb56@gmail.com"
    },
    {
      "id": 3,
      "first_name": "Anna",
      "last_name": "Smith",
      "email": "annasmith23@gmail.com"
    },
  ]
}
"""

struct User {
    var id: Int
    var fist_name: String
    var last_name: String
    var email: String
}

func practice2() {
    let jsonData = jsonString2.data(using: .utf8)
    
    guard
        let json = try? JSONSerialization.jsonObject(with: jsonData!) as? [String: [[String: Any]]],
        let users = json["users"]
        else { return }
    print(users)
    
    for user in users {
        guard let id = user["id"] as? Int else { return }
        guard let fist_name = user["first_name"] as? String else { return }
        guard let last_name = user["last_name"] as? String else { return }
        guard let email = user["email"] as? String else { return }
        print(User(id: id, fist_name: fist_name, last_name: last_name, email: email))
    }
}
practice2()



/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
    let postInfo = "https://jsonplaceholder.typicode.com/posts"
    let apiURL = URL(string: postInfo)!
    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
          guard error == nil else { return print(error!) }
          guard let response = response as? HTTPURLResponse,
              (200..<400).contains(response.statusCode)
              else { return print("Invailid response") }
          guard let data = data else { return }
        
        guard
            let json = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else { return }
        for element in json {
            guard let userId = element["userId"] as? Int else { return }
            guard let id = element["id"] as? Int else { return }
            guard let title = element["title"] as? String else { return }
            guard let body = element["body"] as? String else { return }
            print(Post(userId: userId, id: id, title: title, body: body))
        }
        print(json.count)
    }
    dataTask.resume()
}
practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


