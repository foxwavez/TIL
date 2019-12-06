//: [Previous](@previous)
/*
 싱글톤 방식으로 해보기 전에
 아래에 주어진 코드를 이용해 User에 친구 추가하기
 유저를 전역변수로 사용하지 말 것
 */

class User {
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable {
  let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

class FriendList {
    var user: User
    init(user: User) {
        self.user = user
    }
  func addFriend(name: String) {
    // 호출 시 해당 이름의 친구를 friends 배열에 추가
    let friend = Friends(name: name)
    user.friends.append(friend)
//    user.friends =
  }
  
  func blockFriend(name: String) {
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
//    let friend = Friends(name: name)
//    if let index = user.friends.firstIndex(of: friend)
    
  }
}


//

let user = User()

var friendList = FriendList()
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성


//: [Next](@next)
