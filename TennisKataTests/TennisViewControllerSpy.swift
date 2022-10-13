@testable import TennisKata

class TennisViewControllerSpy: TennisGameViewProtocol {
    
    var title: String = ""
    var score: String = ""
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func displayPlayerOneScore(score: String) {
        self.score = score
    }
    
    func displayPlayerTwoScore(score: String) {
        self.score = score
    }
    
}
