//
//  SettingsRouterTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SettingsRouterTests: XCTestCase {
    
    var settingsRouter: SettingsRouter!
    
    override func setUp() {
        super.setUp()
        settingsRouter = SettingsRouter()
    }
    
    override func tearDown() {
        settingsRouter = nil
        super.tearDown()
    }
    
    func testShowMediaTypesScreen() {
        //given
        let viewController: SettingsViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController
        settingsRouter.viewController = viewController
        
        //when
        settingsRouter.showMediaTypesScreen()
        
        //then
        XCTAssertNotNil(viewController.presentedViewController)
        XCTAssertTrue(viewController.presentedViewController is MediaTypeViewController)
    }
    
    func testShowCountOfMediaScreen() {
        //given
        let viewController: SettingsViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController
        settingsRouter.viewController = viewController
        
        //when
        settingsRouter.showCountOfMediaScreen()
        
        //then
        XCTAssertNotNil(viewController.presentedViewController)
        XCTAssertTrue(viewController.presentedViewController is CountOfMediaViewController)
    }
    
    func testShowDeviceTypeScreen() {
        //given
        let viewController: SettingsViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController
        settingsRouter.viewController = viewController
        
        //when
        settingsRouter.showDeviceTypeScreen()
        
        //then
        XCTAssertNotNil(viewController.presentedViewController)
        XCTAssertTrue(viewController.presentedViewController is DeviceTypeViewController)
    }
    
}
