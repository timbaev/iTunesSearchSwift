//
//  SettingsConfiguratorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SettingsConfiguratorTests: XCTestCase {
    
    var settingsInitializer: SettingsInitializer!
    
    override func setUp() {
        super.setUp()
        settingsInitializer = SettingsInitializer()
    }
    
    override func tearDown() {
        settingsInitializer = nil
        super.tearDown()
    }
    
    func testSetupModule() {
        //given
        let settingsViewController: SettingsViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        settingsInitializer.viewController = settingsViewController
        
        //when
        settingsInitializer.awakeFromNib()
        
        //then
        XCTAssertNotNil(settingsViewController.presenter)
        XCTAssertTrue(settingsViewController.presenter is SettingsPreseter)
        
        let presenter = settingsViewController.presenter as! SettingsPreseter
        
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.interactor is SettingsInteractor)
        XCTAssertTrue(presenter.view is SettingsViewController)
        XCTAssertTrue(presenter.router is SettingsRouter)
        
        let interactor = presenter.interactor as! SettingsInteractor
        
        XCTAssertNotNil(interactor.presenter)
        XCTAssertTrue(interactor.presenter is SettingsPreseter)
        XCTAssertNotNil(interactor.settingsUserDefaultsManager)
        
        let router = presenter.router as! SettingsRouter
        
        XCTAssertNotNil(router.viewController)
        XCTAssertTrue(router.viewController is SettingsViewController)
    }
    
}
