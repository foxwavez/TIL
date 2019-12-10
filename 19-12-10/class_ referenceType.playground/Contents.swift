import UIKit

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
    user.friends.append()
  }
  
  func blockFriend(name: String) {
    
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
   
    // 기존 친구목록에서 제거
    // 블럭 목록에 기존 멤버인 경우 놔두기, 블록목록에 없는 경우 추가
    
  }
}


//

let user = User()

var friendList = FriendList(user: user)
user.friends
user.blocks
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성


