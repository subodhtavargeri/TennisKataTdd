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
    
    func updatePlayerOneScore() -> String {
        return playerOne.calcluateScore.rawValue
    }
    
   
    func getPlayerOneCurrentScore() -> String {
        return playerOne.score.rawValue
    }
    
    func getPlayerTwoCurrentScore() -> String {
        return playerTwo.score.rawValue
    }
    
    func updatePlayerTwoScore() -> String {
        playerTwo.calcluateScore.rawValue
    }
    
}
