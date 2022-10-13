
import XCTest
@testable import TennisKata

class GameTests: XCTestCase {
    
    func test_BothPlayersOnZero_WhenGameIsInitialized() {
        let game = Game()
        
        XCTAssertEqual(Score.zero, game.getPlayerOneCurrentScore())
        XCTAssertEqual(Score.zero, game.getPlayerTwoCurrentScore())
    }
    
    func test_WhenPlayerOneScores_FirstPoint() {
        let game = Game()
        
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.fifteen.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerOneScores_SecondPoint() {
        let game = Game()
        
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.thirty.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerOneScores_ThirdPoint() {
        let game = Game()
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        let expectedScore = Score.forty.rawValue
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerOneScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let originalScore = game.updatePlayerOneScore()
        
        
        let expectedScore = "PlayerOne Wins Game!!!"
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_WhenPlayerTwoeScores_FirstPoint() {
        let game = Game()
        
        let expectedScore = game.updatePlayerTwoScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_PlayerTwoScoresAdvantage_WhneGameisOnDeuce() {
        let game = Game()
        
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        let _ = game.updatePlayerTwoScore()
        
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        let _ = game.updatePlayerOneScore()
        
        let originalScore = game.updatePlayerTwoScore()
        
        let expectedScore = Score.advantage
        XCTAssertEqual(originalScore, expectedScore)
    }
    
    func test_PlayerOneWins_WhenPlayerOneScoreIsOnAdvantage() {
        let game = Game()
        
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
        XCTAssertEqual(Score.forty, expectedScore)
    }
}
