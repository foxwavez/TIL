//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var countDownLabel: UILabel!
    
    var count = 4 {
        didSet { countDownLabel.text = "\(count)" }
    }
    
    // MARK: - View LifeCycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        activityIndicatorView.isHidden = true // 처음엔 뺑글이 안나오게
        
        userIdTextField.center.x = -view.frame.width
        passwordTextField.center.x = -view.frame.width
        loginButton.center.x = -view.frame.width
        
        test()
    }
    

    @IBOutlet weak var testView: UIView!
    func test() {
        let initialFrame = testView.frame
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                animations: {
                                    // 10초 * 0.0 = 0초에 시작, 2.5초 동안 애니메이션
                                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                                        self.testView.center.x += 50
                                        self.testView.center.y += 150
                                        }
                                    
                                    // 10초 * 0.25 = 2.5초에 시작, 2.5초 동안 애니메이션
                                    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                                        self.testView.center.x += 100
                                        self.testView.center.y += 50
                                    })
                                    
                                    // 10초 * 0.7 = 7초에 시작,  3초 동안 애니메이션
                                    UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                                        self.testView.frame = initialFrame
                                        
                                    })
        })
    }
    
    // viewDidload에 요소들이 나타난 다음에 애니메이션이 나타나야 하므로 viewDidAppear에 애니메이션 함수를 실행 시켜야 한다
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // withDuration 시간 동안 delay 시간 뒤에 Aniamaion 실행
        UIView.animate(withDuration: 0.6) {
            self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX
        }
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.passwordTextField.center.x = self.passwordTextField.superview!.bounds.midX
        })
        // 애니메이션 움직임 option 자세하게 보는 사이트 https://cubic-bezier.com/
        /*
         usingSpringWithDamping : 1이면 진동값이 정확히 목표치에 도달
            - 1보다 적게 주면 진동하면서 목표치에 도달(under Damping)
            - 1보다 크게 주면 목표치에 도달하기 전에 끝남(over Damping)
         initialSpringVelocity : 처음에 밀려오는 속도를 조정
            - delfault 0
         damping(얼마나 크게 진동할거냐)과 velocity(목표치까지 가기 위한 속력)가 서로 영향을 주기 때문에 적절히 조절해야 함
         options : bezier curve에 대응되는 애니메이션 전체 동작 속도 설정
            - curveEaseIn,  curveEaseOut, curveEaseInOut, curveLinear
            - autoreverse
            - repeat
         completion : 애니메이션이 종효되었을 때 호출됨
            -  bool : 애니메이션이 정상적으로 끝났는지 여부를 반환, 중간에 다른 화면으로 가는 등 예기치 않은 상황에 false
         */
        UIView.animate(withDuration: 0.6,
                       delay: 1,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        self.loginButton.center.x = self.loginButton.superview!.bounds.midX
        }, completion: {
            print("isFinshed :",$0)
        })
        test()
    }
    
    // MARK: - Action Handler
    
    @IBAction private func didEndOnExit(_ sender: Any) {}
    
    @IBAction private func login(_ sender: Any) {
        view.endEditing(true)
        
        guard countDownLabel.isHidden else { return }
        loginButtonAnimation()
        countDown()
    }
    
    
    func loginButtonAnimation() {
        activityIndicatorView.isHidden = false // 뺑글이 viewDidLoad에서 숨기는게 true여서 애니메이션 보이려면 다시 숨기는 거 false로
        activityIndicatorView.startAnimating()
        
        //  로그인 버튼 위치의 초기값 저장
        let centerOrigin = loginButton.center
        
        UIView.animateKeyframes(withDuration: 1.6,
                                delay: 0,
                                animations: {
                                    // 로긴 버튼을 0.4초 동안 우측 아래로 이동
                                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                                        // closure 쓴거 원래는 animation: { ...} 이렇게 써야 하지만 들여쓰기를 줄이기 위해서
                                        self.loginButton.center.x += 50
                                        self.loginButton.center.y += 20
                                    }
                                    // 버튼이 45도 회전하여 우측 상단으로 이동하여 흐려지다가 사라짐
                                    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                                        self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                                        self.loginButton.center.x += 150.0
                                        self.loginButton.center.y -= 70.0
                                        self.loginButton.alpha = 0.0
                                    }
                                    // 처음에 있던 위치의 아래에 위치하도록 함 (안 보이는 상태)
                                    UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                                        self.loginButton.transform = .identity
                                        self.loginButton.center = CGPoint(
                                            x: centerOrigin.x,
                                            y: self.loginButton.superview!.frame.height + 120
                                        )
                                    }
                                    // self.loginButton.superview?.frame ->
                                    // self.loginButton.superview?.bounds ->
                                    
                                    // 처음에 위치로 돌아오면서 다시 나타남
                                    UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                                        self.loginButton.alpha = 1
                                        self.loginButton.center = centerOrigin
                                    }
        }) { _ in // completion을 Trailing closure 해줌
            // closure에 들어간 거는 self를 해줘야 한다.
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true // 뺑글이 멈추고 나서 숨겨주기
        }
    }
    
    func countDown() {
        countDownLabel.isHidden = false
        
        // transitionCrossDisolve : fade in-out 효과
        // transitionFlipFromTop/Left/Right/Bottom : 해당 방향으로 뒤집는 효과
        
        // 라벨에 숫자의 카운트가 0으로 떨어지면 뺑글이랑 라벨 사라짐
        UIView.transition(with: countDownLabel,
                          duration: 0.5,
                          options: [.transitionCrossDissolve], // fade in-out
                          animations: { self.count -= 1}
        ) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // 재귀함수
                guard self.count == 0 else { return self.countDown() }
                self.count = 4
                self.countDownLabel.isHidden = true
            }
        }
    }
}
