@testable import TennisKata

class TennisViewControllerSpy: TennisGameViewProtocol {
    
    var title: String = ""
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
}
