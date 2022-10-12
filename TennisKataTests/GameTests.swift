
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
        
        let expectedScore = game.getPlayerOneNewScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_WhenPlayerOneScores_SecondPoint() {
        let game = Game()
        
        let _ = game.getPlayerOneNewScore()
        
        let expectedScore = game.getPlayerOneNewScore()
        XCTAssertEqual(Score.thirty, expectedScore)
    }
    
    func test_WhenPlayerOneScores_ThirdPoint() {
        let game = Game()
        
        let _ = game.getPlayerOneNewScore()
        let _ = game.getPlayerOneNewScore()
        
        let expectedScore = game.getPlayerOneNewScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
    
    func test_WhenPlayerOneScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.getPlayerOneNewScore()
        let _ = game.getPlayerOneNewScore()
        let _ = game.getPlayerOneNewScore()
        
        let expectedScore = game.getPlayerOneNewScore()
        XCTAssertEqual(Score.advantage, expectedScore)
    }
    
    func test_WhenPlayerTwoeScores_FirstPoint() {
        let game = Game()
        
        let expectedScore = game.getPlayerTwoNewScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_WhenPlayerTwoScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.getPlayerTwoNewScore()
        let _ = game.getPlayerTwoNewScore()
        let _ = game.getPlayerTwoNewScore()
        
        let expectedScore = game.getPlayerTwoNewScore()
        XCTAssertEqual(Score.advantage, expectedScore)
    }
    
    func test_WhenPlayerTwoLooses_AdvancePoint() {
        let game = Game()
        
        for _ in 1...5 {
            let _ = game.getPlayerTwoNewScore()
        }
        
        let expectedScore = game.getPlayerTwoCurrentScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
    
    func test_WhenPlayerOneLooses_AdvancePoint() {
        let game = Game()
        
        for _ in 1...5 {
            let _ = game.getPlayerOneNewScore()
        }
        
        let expectedScore = game.getPlayerOneCurrentScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
}
