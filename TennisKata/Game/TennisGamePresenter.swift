
protocol TennisGamePresenterProtocol {
    
    func displayViewTitle()
}

class TennisGamePresenter: TennisGamePresenterProtocol {
    
    let view: TennisGameViewProtocol
    init(view: TennisGameViewProtocol) {
        self.view = view
    }
    func displayViewTitle() {
        view.displayViewTitle(title: "Tennis Scoreboard")
        
    }
    
}
