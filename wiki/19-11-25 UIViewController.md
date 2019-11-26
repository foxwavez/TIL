# UI controll

아이패드를 써 본 경우에는 Split View controller 를 확인 할 수 있다

왼쪽에는 뷰컨트롤러 A 오른 쪽에는 

MVC에서 m은 model V는 View C는

addTarget. 코드를 작성할 경우에는 

메모리 부족 시 DidReceiveMemoryWarnigng 메서드에서 꼭 유지하지 않아도 되느 ㄴ자원들은 정리가 필요하다

메모리를 관리를 잘해주면 유저 입장에서 편하게 사용할 수 있다

Appear 화면에 들어간 상태

Disappear 화면에 나간 상태

init은 생성할 때

deinit은 생성을 끝마칠 때

PresentingController : sork

extension : 원래 있던 기능에서 기능을 확장하고 싶을 때 

addSubview: 뷰를 연결하기 위한 명령문 
ex. self.view.addSubView(label)  

Present : 뷰 컨트롤러를 연결하기 위한 명령문
ex. var a = BViewController()
ex. self.present(a, animated: true)



