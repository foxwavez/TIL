//: [Previous](@previous)
/*:
 # PropertyList
 */

import Foundation

struct MacBook: Codable {
  let model: String
  let modelYear: Int
  let display: Int
}

let macBook = MacBook(
  model: "MacBook Pro", modelYear: 2018, display: 15
)

// Codable 이전 - PropertyListSerialization
// Codable 이후 - PropertyListEncoder / PropertyListDecoder

// PropertyListSerialization -> XML을 다룰 때 이걸 사용한다

/*:
 ---
 ## Encoder
 ---
 */
print("\n---------- [ Encoder ] ----------\n")
let pListEncoder = PropertyListEncoder()
let encodedMacBook = try! pListEncoder.encode(macBook)
print(encodedMacBook)

let documentDir = FileManager.default.urls(
  for: .documentDirectory, in: .userDomainMask
  ).first!
let archiveURL = documentDir
  .appendingPathComponent("macBookData")
  .appendingPathExtension("plist")

try? encodedMacBook.write(to: archiveURL) // 파일 경로에 저장


/*:
 ---
 ## Decoder
 ---
 */
print("\n---------- [ Decoder ] ----------\n")
let pListDecoder = PropertyListDecoder()
if let decodedMacBook = try? pListDecoder.decode(MacBook.self, from: encodedMacBook) {
  print(decodedMacBook)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedMacBook = try? pListDecoder.decode(MacBook.self, from: retrievedData) {
  print(retrievedData)
  print(decodedMacBook)
}

// 동일한 작업을 할 때는 PropertyListDecoder 보다는 JsonDecoder가 더 효율적이다

/*:
 ---
 ### Question
 - MacBook 타입을 Array, Dictionary 형태로 Encoding / Decoding 하려면?
 ---
 */
let arr1 = [macBook, macBook, macBook]

let encodedArr1 = try! pListEncoder.encode(arr1) // encode를 하면 데이터타입으로 변환
try? encodedArr1.write(to: archiveURL) // archiveURL 경로에 파일로 endodeArr1을 저장

if let decodeArr1 = try? pListDecoder.decode([MacBook].self, from: encodedArr1) {
    print("디코드 잘 되었니", decodeArr1) // Data 타입에서(encodeArr1) 원래 상태로 돌려놓음(decode)
}

if let getData = try? Data(contentsOf: archiveURL) { // archiveURL 경로에 저장된 파일을 getData 상수에 넣고 불러와서
    if let decodeArr1 = try? pListDecoder.decode([MacBook].self, from: getData) {
        print("파일 경로 찾아서 디코드 잘 되었니", decodeArr1) // getData에 데이터타입을 원래 상태로 돌려놓음(decode)
    }
}


let dict1 = ["mac1": macBook, "mac2": macBook, "mac3": macBook]

let encodedDict1 = try! pListEncoder.encode(dict1)
try? encodedDict1.write(to: archiveURL)

if let decodeDict1 = try? pListDecoder.decode([String: MacBook].self, from: encodedDict1) {
    print("딕셔너리야 디코드 되었니", decodeDict1)
}

if let getData = try? Data(contentsOf: archiveURL) {
    if let decodeDict1 = try? pListDecoder.decode([String: MacBook].self, from: getData) {
        print("파일 경로 찾은 거 잘 불러와 디코드 잘 되었니", decodeDict1)
    }
}

/*:
 ---
 ### Answer
 ---
 */
// Array
print("\n---------- [ Array ] ----------\n")
let arr = [macBook, macBook, macBook]

let encodedArr = try! pListEncoder.encode(arr)
try? encodedArr.write(to: archiveURL)

if let decodedArr = try? pListDecoder.decode([MacBook].self, from: encodedArr) {
  print(decodedArr)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedArr = try? pListDecoder.decode([MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedArr)
}



// Dictionary
print("\n---------- [ Dictionary ] ----------\n")
let dict = ["mac": macBook, "mac1": macBook, "mac2": macBook]

let encodedDict = try! pListEncoder.encode(dict)
try? encodedDict.write(to: archiveURL)

if let decodedDict = try? pListDecoder.decode([String: MacBook].self, from: encodedDict) {
  print(decodedDict)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedDict = try? pListDecoder.decode([String: MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedDict)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
