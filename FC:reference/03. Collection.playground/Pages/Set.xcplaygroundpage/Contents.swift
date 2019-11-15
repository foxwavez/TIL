//: [Previous](@previous)
/*:
 ## Set
 - Unordered Collection
 - Unique Value
 - Set Literal = Array Literal
 */
// 배열 / 딕셔너리에 비해 중요도 ↓

// set은 유니크 밸류 -> 같은 값이 여러번 반복이 되지 않는다, 순서대로 나오지 않는다


//let fruitsArr = ["Apple", "Orange", "Melon"]
//let numbersArr = [1, 2, 3, 3, 3]
//let emptyArr = [String]()


let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()


/*:
 ### Number of Elements
 */
fruitsSet.count

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")
} else {
  print("empty set")
}

/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")



let x: Set = [1, 2, 3, 4, 5]
let y: Set = [1, 2, 3, 4, 5]
x
y

//fruitsSet[0]    // 순서 X -> Index X
x.first   // O


if fruitsSet.contains("Apple") {
  print("Contains Apple")
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
for element in productSet {
  if element.hasPrefix("i") { //hasPrefix는 set 안에 값 중에 첫번째 알파벳이 "i"가 있는지 확인 하는 함수
    print(element)
  }
}


/*:
 ### Add a New Element
 */
print("\n---------- [ Add ] ----------\n")

//[1,2,3].append(1) //append는 맨 뒤에 값을 추가하는 함수인데 set은 순서가 없기 때문에 에러가 난다
//[1,2,3].insert(2, at: 0)

var stringSet: Set<String> = []
stringSet.insert("Apple")
stringSet

stringSet.insert("Orange")
stringSet

stringSet.insert("Orange") // set은 반드시 유일한 값만 가지고 있기 때문에 Oranng 추가는 무시된다.
stringSet


/*:
 ### Remove an Element
 */
print("\n---------- [ Remove ] ----------\n")

stringSet = ["Apple", "Orange", "Melon"]

stringSet.remove("Apple")

if let removed = stringSet.remove("Orange") {
  print("\(removed) has been removed!")
}

stringSet

stringSet.removeAll()


/*:
 ### Compare two sets
 */
print("\n---------- [ Compare ] ----------\n")

var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}


var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])

favoriteFruits1 == favoriteFruits2
favoriteFruits1.elementsEqual(favoriteFruits2) // 순서까지 같아야 할땐 elementsEqual 메소드를 사용한다.



// 포함 관계 여부. 상위/하위 집합.
// group1 ⊇ group2
let group1: Set = ["A", "B", "C"]
let group2: Set = ["A", "B"]

// superset
group1.isSuperset(of: group2)
group1.isStrictSuperset(of: group2)
// strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
group1.isStrictSuperset(of: group1)

// subset
group2.isSubset(of: group1)
group2.isStrictSubset(of: group1)
group2.isStrictSubset(of: group2)


/*:
 ---
 ## Fundamental Set Operations
 - intersection - 교집합
 - symmetricDifference - 교집합의 여집합
 - union - 합집합
 - subtracting - 차집합
 ---
 */

//: ![Set](FundamentalSetOperations.png)



/*:
 ### intersection
 */
print("\n---------- [ intersection ] ----------\n")


favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// isDisjoint - 공집합일 경우 true 반환
if favoriteFruits.isDisjoint(with: tropicalFruits) {
  print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
  print("favoriteFruits ∩ tropicalFruits")
}

// 교집합에 해당하는 요소를 반환
let commonSet = favoriteFruits.intersection(tropicalFruits)
commonSet

// 교집합에 해당하는 요소만 남기고 나머지 제거
tropicalFruits.formIntersection(favoriteFruits)
tropicalFruits



/*:
 ### symmetricDifference
 */
print("\n---------- [ symmetricDifference ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 교집합의 여집합 요소들을 반환
let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
exclusiveSet

// 교집합의 여집합 요소들로 데이터 변경
favoriteFruits.formSymmetricDifference(tropicalFruits)
favoriteFruits


/*:
 ### union
 */
print("\n---------- [ union ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 합집합 반환
var unionSet = favoriteFruits.union(tropicalFruits)
unionSet

// 합집합 요소들로 데이터 변경
favoriteFruits.formUnion(tropicalFruits)
favoriteFruits

/*:
 ### subtracting
 */
print("\n---------- [ subtracting ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 차집합 반환
let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
uncommonSet

// 교집합 요소 제거
favoriteFruits.subtract(tropicalFruits)
favoriteFruits


//: [Next](@next)
