
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
    }
    
    private func displayViewTitle() {
        view.displayViewTitle(title: "Tennis Scoreboard")
    }
    
    func displayPlayerOneScore()-> String {
        return game.getPlayerOneCurrentScore().rawValue
    }
    
    func displayPlayerTwoScore()-> String {
        return game.getPlayerTwoCurrentScore().rawValue
    }
    
    func playerOneWinsPoint()-> String {
        if game.getPlayerOneCurrentScore() != Score.forty {
            let score = game.getPlayerOneNewScore()
            
            if(checkForDucePoint()) {
                return "Deuce"
            }
            
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
        if game.getPlayerTwoCurrentScore() != Score.forty {
            let score = game.getPlayerTwoNewScore()
            
            if(checkForDucePoint()) {
                return "Deuce"
            }
            
            return score.rawValue
        }
        return "PlayerTwo Wins Game!!!"
    }
}
