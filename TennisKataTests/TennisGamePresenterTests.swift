import XCTest
@testable import TennisKata

class TennisGamePresenterTests: XCTestCase {
    let view = TennisViewControllerSpy()
    var game: GameSpy!
    var presenter: TennisGamePresenter!
    
    override func setUp() {
        game = GameSpy()
        presenter = TennisGamePresenter(view: view, game: game)
    }
    
    func test_WhenPresenterIsLoaded_ViewTitleIsSet() {
        presenter?.loadPresenter()
        
        let expectation = "Tennis Scoreboard"
        XCTAssertEqual(view.title,expectation)
    }
    
    func test_WhenGameStarts_PlayerOneScoreIsZero() {
        presenter?.loadPresenter()
        
        let expectation = Score.zero.rawValue
        XCTAssertEqual(view.score, expectation)
    }
    
    func test_WhenGameStarts_PlayerTwoScoreIsZero() {
        presenter?.loadPresenter()
        
        let expectation = Score.zero.rawValue
        XCTAssertEqual(view.score, expectation)
    }
    
    func test_WhenPlayerOne_WinsFirstPoint() {
        let score = presenter?.playerOneWinsPoint()
        
        let expectation = Score.fifteen.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerTwo_WinsFirstPoint() {
        let score = presenter?.playerTwoWinsPoint()
        
        let expectation = Score.fifteen.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerTwo_WinsSecondPoint() {
        var score:String?
        
        for _ in 1...2 {
            score = presenter.playerTwoWinsPoint()
        }
        
        let expectation = Score.thirty.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerOne_WinsSecondPoint() {
        var score:String?
        
        for _ in 1...2 {
            score = presenter.playerOneWinsPoint()
        }
        
        let expectation = Score.thirty.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerOne_WinsThirdPoint() {
        var score:String?
        
        for _ in 1...3 {
            score = presenter.playerOneWinsPoint()
        }
        
        let expectation = Score.forty.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    func test_WhenPlayerTwo_WinsThirdPoint() {
        var score:String?
        
        for _ in 1...3 {
            score = presenter.playerTwoWinsPoint()
        }
        
        let expectation = Score.forty.rawValue
        XCTAssertEqual(score, expectation)
    }
    
    
    
    func test_WhenPlayerOneAndPlayerTwoAreOnDeuce_PlayerOneWinsNextPoint_PlayerOneScoreShouldBeAdvantage() {
        for _ in 1...3 {
            _ = presenter.playerTwoWinsPoint()
        }
        var playerOneScore:String?
        for _ in 1...3 {
            playerOneScore = presenter.playerOneWinsPoint()
        }
        
        playerOneScore = presenter.playerOneWinsPoint()
        
        let expectation = Score.advantage.rawValue
        XCTAssertEqual(playerOneScore,expectation)
    }
    
    func test_WhenPlayerOneAndPlayerTwoAreOnDeuce_PlayerTwoWinsNextPoint_PlayerTwoScoreShouldBeAdvantage() {
        for _ in 1...3 {
            _ = presenter.playerOneWinsPoint()
        }
        var playerTwoScore:String?
        for _ in 1...3 {
            playerTwoScore = presenter.playerTwoWinsPoint()
        }
        
        playerTwoScore = presenter.playerTwoWinsPoint()
        
        let expectation = Score.advantage.rawValue
        XCTAssertEqual(playerTwoScore,expectation)
    }
    
}
