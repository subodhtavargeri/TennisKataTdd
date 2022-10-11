
import XCTest
@testable import TennisKata

class GameTests: XCTestCase {
    
    func test_BothPlayersOnZero_WhenGameIsInitialized() {
        let game = Game()
        
        XCTAssertEqual(Score.zero, game.getPlayerOneScore())
        XCTAssertEqual(Score.zero, game.getPlayerOneScore())
    }
    
    func test_WhenPlayerOneScores_FirstPoint() {
        let game = Game()
        
        let expectedScore = game.getPlayerOneScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_WhenPlayerOneScores_SecondPoint() {
        let game = Game()
        
        let _ = game.getPlayerOneScore()
        
        let expectedScore = game.getPlayerOneScore()
        XCTAssertEqual(Score.thirty, expectedScore)
    }
    
    func test_WhenPlayerOneScores_ThirdPoint() {
        let game = Game()
        
        let _ = game.getPlayerOneScore()
        let _ = game.getPlayerOneScore()
        
        let expectedScore = game.getPlayerOneScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }

    func test_WhenPlayerOneScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.getPlayerOneScore()
        let _ = game.getPlayerOneScore()
        let _ = game.getPlayerOneScore()
        
        let expectedScore = game.getPlayerOneScore()
        XCTAssertEqual(Score.advantage, expectedScore)
    }
    
    func test_WhenPlayerTwoeScores_FirstPoint() {
        let game = Game()
        
        let expectedScore = game.getPlayerTwoScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_WhenPlayerTwoScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.getPlayerTwoScore()
        let _ = game.getPlayerTwoScore()
        let _ = game.getPlayerTwoScore()
        
        let expectedScore = game.getPlayerTwoScore()
        XCTAssertEqual(Score.advantage, expectedScore)
    }

}
