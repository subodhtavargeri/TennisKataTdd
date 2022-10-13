
import XCTest
@testable import TennisKata

class GameTests: XCTestCase {
    
    var game: Game!
    
    override func setUp() async throws {
        game = Game()
    }
    
    func test_BothPlayersOnZero_WhenGameIsInitialized() {
    
        XCTAssertEqual(Score.zero.rawValue, game.getPlayerOneCurrentScore())
        XCTAssertEqual(Score.zero, game.getPlayerTwoCurrentScore())
    }
    
    func test_WhenPlayerOneScores_FirstPoint() {

        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.fifteen.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerOneScores_SecondPoint() {

        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.thirty.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerOneScores_ThirdPoint() {
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.forty.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerOneScores_FourthPoint_AdvancePoint() {
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = "PlayerOne Wins Game!!!"
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerOneScoreIsDeuce_WhenPlayerOneAndPlayerTwoScoreAreFourty() {
        
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = "Deuce"
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerOneScoreAdvantage_WhenPlayerOneScorePlayerTwoScoreAreSame() {
        
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.advantage.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerOneWins_WhenPlayerOneScoreIsOnAdvantage() {
        
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = "PlayerOne Wins Game!!!"
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerTwoScoresFirstPoint() {
        
        let originalScore = game.updatePlayerTwoScore()
        
        let expectedScore = Score.fifteen.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerTwoScoresSecondPoint() {
        
        let _ = game.updatePlayerTwoScore()
        let originalScore = game.updatePlayerTwoScore()
        
        let expectedScore = Score.thirty.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerTwoScoresThirdPoint() {
        
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        let originalScore = game.updatePlayerTwoScore()
        
        let expectedScore = Score.forty.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerTwoLooses_AdvancePoint() {
        let game = Game()
        
        for _ in 1...5 {
            let _ = game.updatePlayerTwoScore()
        }
        
        let expectedScore = game.getPlayerTwoCurrentScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
    
    func test_WhenPlayerOneLooses_AdvancePoint() {
        let game = Game()
        
        for _ in 1...5 {
            let _ = game.updatePlayerOneScore()
        }
        
        let expectedScore = game.getPlayerOneCurrentScore()
        XCTAssertEqual(Score.forty.rawValue, expectedScore)
    }
}
