import XCTest
@testable import TennisKata

class TennisKataViewControllerTests: XCTestCase {
    
    func test_setViewTitle_WhenViewIsLoaded() {
        let view = TennisGameViewController()
        
        view.displayViewTitle(title: "Tennis Kata")
        
        let expectation = "Tennis Kata"
        XCTAssertEqual(view.title, expectation)
    }
}
