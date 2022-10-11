
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
        
        let score = game.getPlayerOneScore()
        XCTAssertEqual(Score.fifteen, score)
    }

}
