//
//  DeviceTypeConfiguratorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class DeviceTypeConfiguratorTests: XCTestCase {
    
    var deviceTypeInitializer: DeviceTypeInitializer!
    
    override func setUp() {
        super.setUp()
        deviceTypeInitializer = DeviceTypeInitializer()
    }
    
    override func tearDown() {
        deviceTypeInitializer = nil
        super.tearDown()
    }
    
    func testSetupModule() {
        //given
        let viewController = DeviceTypeViewController()
        deviceTypeInitializer.viewController = viewController
        
        //when
        deviceTypeInitializer.awakeFromNib()
        
        //then
        XCTAssertNotNil(viewController.presenter)
        XCTAssertTrue(viewController.presenter is DeviceTypePresenter)
        
        let presenter = viewController.presenter as! DeviceTypePresenter
        
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.view is DeviceTypeViewController)
        XCTAssertTrue(presenter.interactor is DeviceTypeInteractor)
        XCTAssertTrue(presenter.router is DeviceTypeRouter)
        
        let interactor = presenter.interactor as! DeviceTypeInteractor
        
        XCTAssertNotNil(interactor.presenter)
        XCTAssertNotNil(interactor.settingsUserDefaultsManager)
        XCTAssertTrue(interactor.presenter is DeviceTypePresenter)
        XCTAssertTrue(interactor.settingsUserDefaultsManager is SettingsUserDefaultsManagerImpl)
        
        let router = presenter.router as! DeviceTypeRouter
        
        XCTAssertNotNil(router.view)
        XCTAssertTrue(router.view is DeviceTypeViewController)
    }
    
}
