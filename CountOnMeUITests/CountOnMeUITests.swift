//
//  CountOnMeUITests.swift
//  CountOnMeUITests
//
//  Created by RICHEUX Antoine on 07/01/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest

class CountOnMeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalculatorView() {
        
        let app = XCUIApplication()
        let button = app.buttons["+"]
        button.tap()
        
        let okButton = app.alerts["Zéro!"].buttons["OK"]
        okButton.tap()
        
        let button2 = app.buttons["-"]
        button2.tap()
        okButton.tap()
        
        let xButton = app.buttons["x"]
        xButton.tap()
        okButton.tap()
        
        let button3 = app.buttons["="]
        button3.tap()
        okButton.tap()
        app.buttons["2"].tap()
        button.tap()
        
        let button4 = app.buttons["8"]
        button4.tap()
        button3.tap()
        
        let cButton = app.buttons["C"]
        cButton.tap()
        app.buttons["6"].tap()
        button2.tap()
        button4.tap()
        button3.tap()
        cButton.tap()
        app.buttons["9"].tap()
        xButton.tap()
        app.buttons["7"].tap()
        button3.tap()
        
        app.buttons["2"].tap()
        button.tap()
        app.buttons["3"].tap()
        xButton.tap()
        app.buttons["5"].tap()
        button2.tap()
        app.buttons["6"].tap()
        button3.tap()
    }
    
}
