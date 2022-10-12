import XCTest
@testable import TennisKata

class TennisGamePresenterTests: XCTestCase {
    let view = TennisViewControllerSpy()
    let game = GameSpy()
    var presenter: TennisGamePresenter?
    
    override func setUp() {
        presenter = TennisGamePresenter(view: view, game: game)
    }
    
    func test_WhenPresenterIsLoaded_ViewTitleIsSet() {
        presenter?.displayViewTitle()
        
        let expectation = "Tennis Scoreboard"
        XCTAssertEqual(view.title,expectation)
    }
    
    func test_WhenGameStarts_PlayerOneScoreIsZero() {
        let expectation = presenter?.displayPlayerOneScore()
        XCTAssertEqual(expectation, Score.zero)
    }
    
    func test_WhenGameStarts_PlayerTwoScoreIsZero() {
        let expectation = presenter?.displayPlayerOneScore()
        XCTAssertEqual(expectation, Score.zero)
    }
}
