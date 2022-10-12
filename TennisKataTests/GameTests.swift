
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
        
        let expectedScore = game.getPlayerOneNextScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_WhenPlayerOneScores_SecondPoint() {
        let game = Game()
        
        let _ = game.getPlayerOneNextScore()
        
        let expectedScore = game.getPlayerOneNextScore()
        XCTAssertEqual(Score.thirty, expectedScore)
    }
    
    func test_WhenPlayerOneScores_ThirdPoint() {
        let game = Game()
        
        let _ = game.getPlayerOneNextScore()
        let _ = game.getPlayerOneNextScore()
        
        let expectedScore = game.getPlayerOneNextScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
    
    func test_WhenPlayerOneScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.getPlayerOneNextScore()
        let _ = game.getPlayerOneNextScore()
        let _ = game.getPlayerOneNextScore()
        
        let expectedScore = game.getPlayerOneNextScore()
        XCTAssertEqual(Score.advantage, expectedScore)
    }
    
    func test_WhenPlayerTwoeScores_FirstPoint() {
        let game = Game()
        
        let expectedScore = game.getPlayerTwoNextScore()
        XCTAssertEqual(Score.fifteen, expectedScore)
    }
    
    func test_WhenPlayerTwoScores_FourthPoint_AdvancePoint() {
        let game = Game()
        
        let _ = game.getPlayerTwoNextScore()
        let _ = game.getPlayerTwoNextScore()
        let _ = game.getPlayerTwoNextScore()
        
        let expectedScore = game.getPlayerTwoNextScore()
        XCTAssertEqual(Score.advantage, expectedScore)
    }
    
    func test_WhenPlayerTwoLooses_AdvancePoint() {
        let game = Game()
        
        for _ in 1...5 {
            let _ = game.getPlayerTwoNextScore()
        }
        
        let expectedScore = game.getPlayerTwoCurrentScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
    
    func test_WhenPlayerOneLooses_AdvancePoint() {
        let game = Game()
        
        for _ in 1...5 {
            let _ = game.getPlayerOneNextScore()
        }
        
        let expectedScore = game.getPlayerOneCurrentScore()
        XCTAssertEqual(Score.forty, expectedScore)
    }
}
