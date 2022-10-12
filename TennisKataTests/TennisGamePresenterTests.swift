import XCTest
@testable import TennisKata

class TennisGamePresenterTests: XCTestCase {
    
    func test_WhenPresenterIsLoaded_ViewTitleIsSet() {
        let view = TennisViewControllerSpy()
        let game = GameSpy()
        let presenter = TennisGamePresenter(view: view, game: game)
        
        presenter.displayViewTitle()
        
        let expectation = "Tennis Scoreboard"
        XCTAssertEqual(view.title,expectation)
    }
    
    func test_WhenGameStarts_PlayerOneScoreIsZero() {
        let view = TennisViewControllerSpy()
        let game = GameSpy()
        let presenter = TennisGamePresenter(view: view, game: game)
        
        XCTAssertEqual(presenter.displayPlayerOneScore(), Score.zero)
    }
}
