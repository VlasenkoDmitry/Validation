import XCTest

class task4_testUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }
    
    func testKeyboardOpen() throws {
        app.textFields["Enter login"].tap()
        XCTAssert(app.keyboards.buttons["Return"].exists)
    }
    
    func testOpenFailAlertTapAlertButton() throws {
        app.textFields["Enter login"].tap()
        app.textFields["Enter login"].typeText("2")
        app.buttons["Return"].tap()
        app.alerts["Fail"].buttons["OK"].tap()
        XCTAssert(app.alerts["Fail"].exists == false)
    }
    
    func testOpenSuccessAlertEmail() throws {
        app.textFields["Enter login"].tap()
        app.textFields["Enter login"].typeText("hello@mail.ru")
        app.buttons["Return"].tap()
        XCTAssert(app.alerts["Success"].exists)
    }
    
    func testOpenSuccessAlertNickname() throws {
        app.textFields["Enter login"].tap()
        app.textFields["Enter login"].typeText("Dmitry")
        app.buttons["Return"].tap()
        XCTAssert(app.alerts["Success"].exists)
    }
    
    func testOpenSuccessAlertTapAlertButton() throws {
        app.textFields["Enter login"].tap()
        app.textFields["Enter login"].typeText("hello@mail.ru")
        app.buttons["Return"].tap()
        app.alerts["Success"].buttons["OK"].tap()
        XCTAssert(app.alerts["Success"].exists == false)
    }
}
