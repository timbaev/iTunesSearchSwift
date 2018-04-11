//
//  MediaTypeConfiguratorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class MediaTypeConfiguratorTests: XCTestCase {
    
    var mediaTypeInitializer: MediaTypeInitializer!
    
    override func setUp() {
        super.setUp()
        mediaTypeInitializer = MediaTypeInitializer()
    }
    
    override func tearDown() {
        mediaTypeInitializer = nil
        super.tearDown()
    }
    
    func testSetupModule() {
        //given
        let viewController = MediaTypeViewController()
        mediaTypeInitializer.viewController = viewController
        
        //when
        mediaTypeInitializer.awakeFromNib()
        
        //then
        XCTAssertNotNil(viewController.presenter)
        XCTAssertTrue(viewController.presenter is MediaTypePresenter)
        
        let presenter = viewController.presenter as! MediaTypePresenter
        
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.view is MediaTypeViewController)
        XCTAssertTrue(presenter.interactor is MediaTypeInteractor)
        XCTAssertTrue(presenter.router is MediaTypeRouter)
        
        let interactor = presenter.interactor as! MediaTypeInteractor
        
        XCTAssertNotNil(interactor.presenter)
        XCTAssertTrue(interactor.presenter is MediaTypePresenter)
        XCTAssertNotNil(interactor.settingsUserDefaultsManager)
        XCTAssertTrue(interactor.settingsUserDefaultsManager is SettingsUserDefaultsManagerImpl)
        
        let router = presenter.router as! MediaTypeRouter
        
        XCTAssertNotNil(router.viewController)
        XCTAssertTrue(router.viewController is MediaTypeViewController)
    }
    
}
