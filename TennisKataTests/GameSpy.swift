@testable import TennisKata

class GameSpy: GameProtocol {
    
    func getPlayerOneCurrentScore() -> Score {
        return .zero
    }
    
    func getPlayerTwoCurrentScore() -> Score {
        return .zero
        
    }
    
    
}
