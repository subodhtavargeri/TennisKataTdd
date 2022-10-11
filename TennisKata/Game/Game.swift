class Game {
    
    private var playerOne: Player
    private var playerTwo: Player
    
    init() {
        self.playerOne = Player(score: .zero)
        self.playerTwo = Player(score: .zero)
    }
    
    func getPlayerOneNextScore() -> Score {
        return self.playerOne.calcluateScore
    }
    
    func getPlayerTwoNextScore() -> Score {
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
