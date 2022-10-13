
protocol GameProtocol {
    func getPlayerOneCurrentScore() -> Score
    func getPlayerTwoCurrentScore() -> Score
    func updatePlayerTwoScore() -> Score
    func updatePlayerOneScore() -> String
}
class Game: GameProtocol {
    
    private var playerOne: Player
    private var playerTwo: Player
    
    init() {
        self.playerOne = Player(score: .zero)
        self.playerTwo = Player(score: .zero)
    }
    
    func updatePlayerOneScore() -> String {
        if playerOne.score != Score.forty && playerOne.score != Score.advantage {
            let score = playerOne.calcluateScore
            
            if(checkForDucePoint()) {
                return "Deuce"
            }
            
            return score.rawValue
        }
        
        if(checkForDucePoint()) {
            let score = playerOne.calcluateScore
            return score.rawValue
        }
        
        return "PlayerOne Wins Game!!!"
    }
    
    func checkForDucePoint() -> Bool {
        if playerOne.score == Score.forty && playerTwo.score == Score.forty {
            return true
        }
        return false
    }
    
    func updatePlayerTwoScore() -> Score {
        return self.playerTwo.calcluateScore
    }
    
    func getPlayerOneCurrentScore() -> Score {
        return self.playerOne.score
    }
    
    func getPlayerTwoCurrentScore() -> Score {
        return self.playerTwo.score
    }
}

struct Player {
    var score: Score
    
    var calcluateScore: Score {
        mutating get {
            if self.score == .zero {
                score = .fifteen
                return score
            }
            if self.score == .fifteen {
                score = .thirty
                return score
            }
            if self.score == .thirty {
                score = .forty
                return score
            }
            if self.score == .forty {
                score = .advantage
                return score
            }
            if self.score == .advantage {
                score = .forty
                return score
            }
            return score
        }
    }
}

enum Score: String {
    case zero = "0"
    case fifteen = "15"
    case thirty = "30"
    case forty = "40"
    case advantage = "Advantage"
}
