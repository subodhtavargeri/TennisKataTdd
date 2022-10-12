
protocol TennisGamePresenterProtocol {
    func displayViewTitle()
}

class TennisGamePresenter: TennisGamePresenterProtocol {
    
    let view: TennisGameViewProtocol
    let game: GameProtocol
    
    init(view: TennisGameViewProtocol,
         game: GameProtocol) {
        self.view = view
        self.game = game
    }
    
    func displayViewTitle() {
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
            return score.rawValue
        }
        return "PlayerOne Wins Game!!!"
    }
    
    func playerTwoWinsPoint()-> String {
        let score = game.getPlayerTwoNewScore()
        return score.rawValue
    }

}
