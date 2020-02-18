//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/*
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 */
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
  "name": "Orange",
  "cost": 100,
  "description": "A juicy orange"
},
{
  "name": "Apple",
  "cost": 200
},
{
  "name": "Watermelon",
  "cost": 300
},
]
""".data(using: .utf8)!


struct Fruit: Codable {
    let name: String
    let cost: Int
    let description: String?
}


let fruits = try decoder.decode([Fruit].self, from: jsonFruits)
for fruit in fruits {
    print(fruit)
}



/*
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 */
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
    let name: String
    let id: String
    let count: String
    let data: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case id = "report_id"
        case count = "read_count"
        case data = "report_date"
    }
}

if let report = try? decoder.decode(Report.self, from: jsonReport) {
    print(report)
}


/*
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 */

print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      { "title": "Gran Torino", "release_year": 2008 },
      { "title": "3 Idiots", "release_year": 2009 },
      { "title": "Big Fish", "release_year": 2003 },
    ]
  }
]
""".data(using: .utf8)!

struct Person: Decodable {
    let name: String
    let movies: [Movie]
    
    struct Movie: Decodable {
        let title: String
        let year: Int
        
        private enum CodingKeys: String, CodingKey {
            case title
            case year = "release_year"
        }
    }
    private enum CodingKeys: String, CodingKey {
        case name
        case movies = "favorite_movies"
    }
}
if let person = try? decoder.decode([Person].self, from: jsonMovie) {
    print("name", person[0].name)
    for movie in person[0].movies {
        print(movie)
    }
    
}



/*
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - https://api.github.com/search/repositories?q=user:giftbott
 - 위 URL의 user 부분을 자신의 아이디로 변경
 */

struct Repositories {
}


func fetchGitHubRepositories() {
//  let urlString = "https://api.github.com/search/repositories?q=user:giftbott"
//  let url = URL(string: urlString)!

}

fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
