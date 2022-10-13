
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
        let playerOneScore = game.getPlayerOneCurrentScore()
        view.displayPlayerOneScore(score: playerOneScore)
    }
    
    func displayPlayerTwoScore() {
        let playerTwoScore = game.getPlayerTwoCurrentScore()
        view.displayPlayerOneScore(score: playerTwoScore)
    }
    
//    func playerOneWinsPoint()-> String {
//        if game.getPlayerOneCurrentScore() != Score.forty && game.getPlayerOneCurrentScore() != Score.advantage {
//            let score = game.updatePlayerOneScore()
//
//            if(checkForDucePoint()) {
//                return "Deuce"
//            }
//
//            return score.rawValue
//        }
//
//        if(checkForDucePoint()) {
//            let score = game.updatePlayerOneScore()
//            return score.rawValue
//        }
//
//        return "PlayerOne Wins Game!!!"
//    }
    
    func playerOneWinsPoint()-> String {
        return game.updatePlayerOneScore()
    }
    
    
    func playerTwoWinsPoint()-> String {
        return game.updatePlayerTwoScore()
    }
}
