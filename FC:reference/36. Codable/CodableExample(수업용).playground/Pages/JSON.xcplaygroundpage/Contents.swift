//: [Previous](@previous)
/*:
 # JSON
 */
import Foundation

struct MacBook: Codable {
  let model: String
  let modelYear: Int
  let display: Int
}

// 인스턴스 생성
let macBook = MacBook(
  model: "MacBook Pro", modelYear: 2018, display: 15
)

// Codable 이전 - JSONSerialization
// Codable 이후 - JSONEncoder / JSONDecoder

/*:
 ---
 ## Encoder
 ---
 */
print("\n---------- [ Encoder ] ----------\n")
let jsonEncoder = JSONEncoder()
let encodedMacBook = try! jsonEncoder.encode(macBook)
print(encodedMacBook)

// JSON파일로 저장
let documentDir = FileManager.default.urls(
  for: .documentDirectory, in: .userDomainMask
  ).first!
let archiveURL = documentDir
  .appendingPathComponent("macBookData")
  .appendingPathExtension("json")

do {
  try encodedMacBook.write(to: archiveURL) // archiveURL는 파일 경로
} catch {
  print(error.localizedDescription)
}
// 실행을 했을 때 프린트에 아무것도 나오지 않으면 저장이 잘 된거다

/*:
 ---
 ## Decoder
 ---
 */
print("\n---------- [ Decoder ] ----------\n")
let jsonDecoder = JSONDecoder()
if let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: encodedMacBook) {
  print(decodedMacBook)
}

// 파일에서 불러오기
if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: retrievedData) {
  print(retrievedData)
  print(decodedMacBook)
}


/*
 Array
 */
print("\n---------- [ Array ] ----------\n")
let arr = [macBook, macBook, macBook]

let encodedArr = try! jsonEncoder.encode(arr)
try? encodedArr.write(to: archiveURL)
                                // 주의!!!  MacBook타입이지만 [] Array타입으로도 명시해줘야 한다.
if let decodedArr = try? jsonDecoder.decode([MacBook].self, from: encodedArr) {
  print(decodedArr)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedArr = try? jsonDecoder.decode([MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedArr)
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------\n")
let dict = ["mac": macBook, "mac1": macBook, "mac2": macBook]
let encodedDict = try! jsonEncoder.encode(dict)
try? encodedDict.write(to: archiveURL)

if let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: encodedDict) {
  print(decodedDict)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
                             // 주의!!!  MacBook타입이지만 [String: 지정한 타입] 딕셔너리 타입으로도 명시해줘야 한다.
  let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedDict)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
