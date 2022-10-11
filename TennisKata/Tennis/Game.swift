class Game {
    
    var playerOne: Player
    let playerTwo: Player
    
    init() {
        self.playerOne = Player(score: .zero)
        self.playerTwo = Player(score: .zero)
    }
    
    func getPlayerOneScore() -> Score {
        return self.playerOne.calcluateScore
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
                score = .forty
                return score
            }
            return score
        }
    }
}

enum Score {
    case zero
    case fifteen
    case thirty
    case forty
    case advantage
}
