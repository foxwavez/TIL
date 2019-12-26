//: [Previous](@previous)
import Foundation


/*
 1) 업캐스팅과 다운캐스팅에 대하여 설명하고,
 2) 업캐스팅과 다운캐스팅을 시도할 때 사용하는 키워드에 대해 각각 설명
 */

// 1) 업캐스팅: 상속 관계의 클래스에서 부모클래스에 있는 요소에 접근할 때 사용
//    다운캐스팅: 상속 관계의 클래스에서 자식클래스의 있는 요소에 접근할 때 사용
// 2) as?: 클래스에 접근하는 요소가 없을 때는 nil을 반환하고 있을 때 접근한다
//    as!: 클래스에 접근하는 요소가 무조건 있다고 가정해서 옵셔널을 벗기고 접근
//.   as: ..



/*
 TableView에서 셀을 재사용할 때 사용되는 아래의 두 메서드가 각각
 1) 언제 사용되고  2) 차이점은 무엇인지에 대하여 작성
 - dequeueReusableCell(withIdentifier:)
 - dequeueReusableCell(withIdentifier:for:)
 */

// 1) extension <#Extention class#>: UITableViewDataSource 에서 사용된다
// 2) dequeReusableCell(withIdentifier:) -> cell 식별자를 확인해서 재사용
//    dequeueReusableCell(withIdentifier:for:) -> cell 식별자를 확인해서 재사용 & indexPath 정보를 확인해서 셀 갯수 정함




/*
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 */

// safeAreaInsets / safeAreaLayoutGuide
// safeAreaInsets은 내가 view에 올린 오브젝트 기준으로 safeArea를 추가해주는 역할
// safeAreaLayoutGuide는 오토레이아웃을 anchor를 사용하여 코드로 작성 할때 view 기준으로 safeArea를 잡아주는 역할 -> 아이폰 10 이상 부터 노치공간과 홈버튼 기능으로 바뀐 공간 을 빼주는



/* Strong Reference Cycle 에 대해 1) 설명하고 2) 예시 코드 작성
 */

// ???


/*
 Strong, Unowned, Weak 각각의 특징과 차이점에 대해 설명
 */

// Strong: 변수 선언할 때 Default로 주어지는 특성
// Unowed: ??
// Weak: class 바깥에서는 사용하거나 참조할 수 없는 변수를 생성하고 싶을 때 사용







/*
 Intrinsic Content Size란 무엇이고 어떤 특징을 가지는지 설명
 */

// ??? 

//: [Next](@next)
