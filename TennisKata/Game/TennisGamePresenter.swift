
protocol TennisGamePresenterProtocol {
    func loadPresenter()
}

class TennisGamePresenter: TennisGamePresenterProtocol {
    
    let view: TennisGameViewProtocol
    let game: GameProtocol
    
    init(view: TennisGameViewProtocol,
         game: GameProtocol) {
        self.view = view
        self.game = game
    }
    
    func loadPresenter() {
        displayViewTitle()
        displayPlayerOneScore()
        displayPlayerTwoScore()
    }
    
    private func displayViewTitle() {
        view.displayViewTitle(title: "Tennis Scoreboard")
    }
    
    private func displayPlayerOneScore() {
        let playerOneScore = game.getPlayerOneCurrentScore().rawValue
        view.displayPlayerOneScore(score: playerOneScore)
    }
    
    func displayPlayerTwoScore() {
        let playerTwoScore = game.getPlayerTwoCurrentScore().rawValue
        view.displayPlayerOneScore(score: playerTwoScore)
    }
    
    func playerOneWinsPoint()-> String {
        if game.getPlayerOneCurrentScore() != Score.forty && game.getPlayerOneCurrentScore() != Score.advantage {
            let score = game.getPlayerOneNewScore()
            
            if(checkForDucePoint()) {
                return "Deuce"
            }
            
            return score.rawValue
        }
        
        if(checkForDucePoint()) {
            let score = game.getPlayerOneNewScore()
            return score.rawValue
        }
        
        return "PlayerOne Wins Game!!!"
    }
    
    func checkForDucePoint() -> Bool {
        if game.getPlayerTwoCurrentScore() == Score.forty && game.getPlayerOneCurrentScore() == Score.forty {
            return true
        }
        return false
    }
    
    func playerTwoWinsPoint()-> String {
        if game.getPlayerTwoCurrentScore() != Score.forty && game.getPlayerTwoCurrentScore() != Score.advantage  {
            let score = game.getPlayerTwoNewScore()
            
            if(checkForDucePoint()) {
                return "Deuce"
            }
            
            return score.rawValue
        }
        
        if(checkForDucePoint()) {
            let score = game.getPlayerTwoNewScore()
            return score.rawValue
        }
        
        return "PlayerTwo Wins Game!!!"
    }
}
