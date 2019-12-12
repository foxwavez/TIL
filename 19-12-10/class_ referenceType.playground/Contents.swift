import UIKit

class User {
  var 친구들: [친구] = [] //value type을 가지고 있는 배열
  var blocks: [친구] = []
}
struct 친구: Equatable { // value type
  let name: String // struct는 init() 없이 초기화가 된다. 자동으로 쓸 수 있다
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
    let 친구모음 = 친구(name: name)
    user.친구들.append(친구모음)
  }
   
  func blockFriend(name: String) {
    
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    let 친구모음 = 친구(name: name)
    user.blocks.append(친구모음)
    // 기존 친구목록에서 제거
    // 블럭 목록에 기존 멤버인 경우 놔두기, 블록목록에 없는 경우 추가
    
  }
}


//

let user = User()

var friendList = FriendList(user: user)
user.친구들
user.blocks
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
user.친구들   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
friendList.blockFriend(name: "정우성")
user.친구들   // 원빈, 장동건
user.blocks    // 정우성


