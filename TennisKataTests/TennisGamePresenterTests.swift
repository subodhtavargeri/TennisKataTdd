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
        let score = presenter?.displayPlayerOneScore()
        
        let expectation = Score.zero.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenGameStarts_PlayerTwoScoreIsZero() {
        let score = presenter?.displayPlayerTwoScore()
        
        let expectation = Score.zero.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerOne_WinsFirstPoint() {
        let score = presenter?.playerOneWinsPoint()
        
        let expectation = Score.fifteen.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerTwo_WinsSecondPoint() {
        let score = presenter?.playerTwoWinsPoint()
        
        let expectation = Score.fifteen.rawValue
        XCTAssertEqual(score, expectation)
    }
    
}
