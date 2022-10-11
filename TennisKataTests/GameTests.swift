
import XCTest
@testable import TennisKata

class GameTests: XCTestCase {
    
    func test_BothPlayersOnZero_WhenGameIsInitialized() {
        let game = Game()
        
        XCTAssertEqual(Score.zero, game.playerOne.score)
        XCTAssertEqual(Score.zero, game.playerTwo.score)
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

}
