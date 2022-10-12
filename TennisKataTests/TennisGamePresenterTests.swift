import XCTest
@testable import TennisKata

class TennisGamePresenterTests: XCTestCase {
    
    func test_WhenPresenterIsLoaded_ViewTitleIsSet() {
        let view = TennisViewControllerSpy()
        let presenter = TennisGamePresenter(view: view)
        
        presenter.displayViewTitle()
        
        let expectation = "Tennis Scoreboard"
        XCTAssertEqual(view.title,expectation)
    }
    
}
