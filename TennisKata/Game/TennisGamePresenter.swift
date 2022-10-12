
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
    
    func displayPlayerOneScore() -> Score {
        return game.getPlayerOneCurrentScore()
    }
    
    func displayPlayerTwoScore() -> Score {
        return game.getPlayerTwoCurrentScore()
    }
    
}
