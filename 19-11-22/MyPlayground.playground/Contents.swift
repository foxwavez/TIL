//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        let greenView = setUpSuperview()
        _ = setUpSubview(superView: greenView)
        
        greenView.frame.origin = CGPoint(x: 15, y: 460)
//        greenView.bounds.origin = CGPoint(x: 15, y: 15)
    }
    
    func setUpSuperview() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 0, y: 0, width: 345, height: 100)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    func setUpSubview(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
