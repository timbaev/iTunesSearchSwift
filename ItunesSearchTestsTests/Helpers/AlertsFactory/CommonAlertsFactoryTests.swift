//
//  CommonAlertsFactoryTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class CommonAlertsFactoryTests: XCTestCase {
    
    var alertsFactory: CommonAlertsFactoryImpl!
    
    override func setUp() {
        super.setUp()
        alertsFactory = CommonAlertsFactoryImpl()
    }
    
    override func tearDown() {
        alertsFactory = nil
        super.tearDown()
    }
    
    func testThatGetErrorAlertReturnAlertWithCorrectAttributes() {
        //given
        let expectedMessage = "Oups..error.."
        let expectedTitle = alertsFactory.errorTitle
        let expectedButtonText = alertsFactory.okButtonText
        let exptectedPrefferedStyle = UIAlertControllerStyle.alert
        let expectedButtonStyle = UIAlertActionStyle.default
        
        //when
        let alert = alertsFactory.getErrorAlert(with: expectedMessage)
        
        //then
        XCTAssertTrue(alert is UIAlertController)
        
        let alertController = alert as! UIAlertController
        
        XCTAssertNotNil(alertController.message)
        XCTAssertEqual(expectedMessage, alertController.message)
        
        XCTAssertNotNil(alertController.title)
        XCTAssertEqual(expectedTitle, alertController.title)
        
        XCTAssertNotNil(alertController.actions.first)
        XCTAssertEqual(expectedButtonText, alertController.actions.first?.title)
        XCTAssertEqual(expectedButtonStyle, alertController.actions.first?.style)
        XCTAssertEqual(exptectedPrefferedStyle, alertController.preferredStyle)
    }
    
}
