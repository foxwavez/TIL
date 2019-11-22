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
        let blueView = setUpSperview()
        blueView.frame.origin = CGPoint(x: 15, y: 15)
    }
    func setUpSperview() -> UIView {
        let blueView = UIView()
        blueView.frame = CGRect(x: 0, y: 0, width: 345, height: 635)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        return blueView
    }

}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
