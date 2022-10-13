
protocol TennisGamePresenterProtocol {
    func loadPresenter()
}

class TennisGamePresenter: TennisGamePresenterProtocol {
    
    weak private var view: TennisGameViewProtocol?
    private let game: GameProtocol
    
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
        view?.displayViewTitle(title: "Tennis Scoreboard")
    }
    
    private func displayPlayerOneScore() {
        let playerOneScore = game.getPlayerOneCurrentScore()
    }
    
    func displayPlayerTwoScore() {
        let playerTwoScore = game.getPlayerTwoCurrentScore()
    }
        
    func playerOneWinsPoint()-> String {
        return game.updatePlayerOneScore()
    }
    
    func playerTwoWinsPoint()-> String {
        return game.updatePlayerTwoScore()
    }
}
