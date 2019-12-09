import UIKit

struct User {
  var friends: [Friends1] = []
  var blocks: [Friends1] = []
}

struct Friends1: Equatable {
  let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

struct FriendList {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    mutating func addFriend(name: String) -> User {
    // 호출 시 해당 이름의 친구를 friends 배열에 추가
        let friend = Friends1(name: name)
        user.friends.append(friend)
        return user
  }
  
  func blockFriend(name: String) {
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    
  }
}


//

var user = User()

var friendList = FriendList(user: user)
user = friendList.addFriend(name: "원빈")
user = friendList.addFriend(name: "장동건")
user = friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성



//* *//




class User2 {
  var friends2: [Friends2] = []
  var blocks2: [Friends2] = []
}
struct Friends2: Equatable {
  let name2: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

class FriendList2 {
    var user2: User2
    init(user: User2) {
        self.user2 = user
    }
  func addFriend1(name: String) {
    // 호출 시 해당 이름의 친구를 friends 배열에 추가
    let friends2 = Friends2(name2: name)
    user2.friends2.append(friends2)
  }
  
  func blockFriend2(name: String) {
    
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    let friend2 = Friends2(name2: name)
    
    if let index = user2.friends2.firstIndex(of: friend2) {
        user2.friends2.remove(at: index)
    }
    if !user2.blocks2.contains(friend2) {
    user2.blocks2.append(friend2)
    }
    // 기존 친구목록에서 제거
    // 블럭 목록에 기존 멤버인 경우 놔두기, 블록목록에 없는 경우 추가
    
  }
}


//

let user2 = User2()

var friendList2 = FriendList2(user: user2)
friendList2.user2
friendList2.addFriend1(name: "원빈")
friendList2.addFriend1(name: "장동건")
friendList2.addFriend1(name: "정우성")
user2.friends2   // 원빈, 장동건, 정우성

friendList2.blockFriend2(name: "정우성")
friendList2.blockFriend2(name: "정우성")
user2.friends2   // 원빈, 장동건
user2.blocks2    // 정우성

