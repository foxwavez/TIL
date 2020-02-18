//: [Previous](@previous)
//: # Nested Keys
import Foundation


let jsonData = """
[
{
  "latitude": 30.0,
  "longitude": 40.0,
  "additionalInfo": {
    "elevation": 50.0,
  }
},
{
  "latitude": 60.0,
  "longitude": 120.0,
  "additionalInfo": {
    "elevation": 20.0
  }
}
]
""".data(using: .utf8)!


struct Coordinate {
 // elevation이 같은 레벨에 없기 때문에
  var latitude: Double
  var longitude: Double
  var elevation: Double

  enum CodingKeys: String, CodingKey { // 맨처음에 enum 이름은 CodingKeys 라고 해줘야 한다. -> 안 그럼 에러
    // CodingKey에는 json data에서의 key를 갖고
    case latitude
    case longitude
    case additionalInfo
  }
    // 다른 레벨에 있는 key에도 CodingKey 구현
  enum AdditionalInfoKeys: String, CodingKey {
    case elevation
  }
}


extension Coordinate: Decodable {
  init(from decoder: Decoder) throws { //throws를 함수를 사용했을 때는 바로 try만 사용해서 처리할 수 있다
    let values = try decoder.container(keyedBy: CodingKeys.self) // throws가 없으면 do catch문을 사용해야 한다
    latitude = try values.decode(Double.self, forKey: .latitude)
    longitude = try values.decode(Double.self, forKey: .longitude)

    let additionalInfo = try values.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
  }
}


extension Coordinate: Encodable {
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(latitude, forKey: .latitude)
    try container.encode(longitude, forKey: .longitude)

    var additionalInfo = container.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    try additionalInfo.encode(elevation, forKey: .elevation)
  }
}


do {
  let coordinates = try JSONDecoder().decode([Coordinate].self, from: jsonData)
  coordinates.forEach { print($0) }
} catch {
  print(error.localizedDescription)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
