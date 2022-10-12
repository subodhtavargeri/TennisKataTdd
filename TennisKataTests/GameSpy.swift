@testable import TennisKata

class GameSpy: GameProtocol {
    private var playerOne: Player
    private var playerTwo: Player
    
    init() {
        self.playerOne = Player(score: .zero)
        self.playerTwo = Player(score: .zero)
    }
    
    func getPlayerOneCurrentScore() -> Score {
        return playerOne.score
    }
    
    func getPlayerTwoCurrentScore() -> Score {
        return playerTwo.score
        
    }
    
    func getPlayerOneNewScore() -> Score {
        return playerOne.calcluateScore
    }
    
    func getPlayerTwoNewScore() -> Score {
        return playerTwo.calcluateScore
    }
    
}
