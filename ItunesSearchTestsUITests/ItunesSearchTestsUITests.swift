//
//  ItunesSearchTestsUITests.swift
//  ItunesSearchTestsUITests
//
//  Created by Тимур Шафигуллин on 13.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest

class ItunesSearchTestsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSearchMedia() {
        
        let app = XCUIApplication()
        
        app.tabBars.buttons["Settings"].tap()
    
        let tablesQuety = app.tables
        tablesQuety.staticTexts["Media type"].tap()
        app.tables.staticTexts["movie"].tap()
        app.navigationBars["Media type"].buttons["Settings"].tap()
        
        app.tabBars.buttons["Search"].tap()
        
        app.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("Movie")
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Jon Favreau"]/*[[".cells.staticTexts[\"Jon Favreau\"]",".staticTexts[\"Jon Favreau\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let okButton = app.buttons["OK"]
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: okButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        okButton.tap()
        
        app.buttons["Done"].tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Jake Kasdan"]/*[[".cells.staticTexts[\"Jake Kasdan\"]",".staticTexts[\"Jake Kasdan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        expectation(for: exists, evaluatedWith: okButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        okButton.tap()
        
        app.buttons["Done"].tap()
    }
    
    func testSettingsScreen() {
        let app = XCUIApplication()
        app.tabBars.buttons["Settings"].tap()
        
        let tablesQuety = app.tables
        tablesQuety.staticTexts["Media type"].tap()
        
        app.tables.staticTexts["movie"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["audiobook"]/*[[".cells.staticTexts[\"audiobook\"]",".staticTexts[\"audiobook\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Media type"].buttons["Settings"].tap()
        
        tablesQuety.staticTexts["Count of media"].tap()
        
        app.pickerWheels.element.adjust(toPickerWheelValue: "1")
        app.pickerWheels["1"].swipeUp()
        
        app.navigationBars["Count of media"].buttons["Settings"].tap()
        
        tablesQuety.staticTexts["Devices"].tap()
        
        app.tables.staticTexts["iPhone"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["all"]/*[[".cells.staticTexts[\"all\"]",".staticTexts[\"all\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Device type"].buttons["Settings"].tap()
    }
    
}
