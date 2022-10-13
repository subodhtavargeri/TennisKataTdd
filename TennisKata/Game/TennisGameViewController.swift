import UIKit

protocol TennisGameViewProtocol: AnyObject {
    func displayViewTitle(title: String)
}

class TennisGameViewController: UIViewController {
    
}

extension TennisGameViewController: TennisGameViewProtocol {
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    
}
