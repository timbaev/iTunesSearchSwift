//
//  CountOfMediaConfiguratorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class CountOfMediaConfiguratorTests: XCTestCase {
    
    var countOfMediaInitializer: CountOfMediaInitializer!
    
    override func setUp() {
        super.setUp()
        countOfMediaInitializer = CountOfMediaInitializer()
    }
    
    override func tearDown() {
        countOfMediaInitializer = nil
        super.tearDown()
    }
    
    func testSetupModule() {
        //given
        let viewController = CountOfMediaViewController()
        countOfMediaInitializer.viewController = viewController
        
        //when
        countOfMediaInitializer.awakeFromNib()
        
        //then
        XCTAssertNotNil(viewController.presenter)
        XCTAssertTrue(viewController.presenter is CountOfMediaPresenter)
        
        let presenter = viewController.presenter as! CountOfMediaPresenter
        
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.view is CountOfMediaViewController)
        XCTAssertTrue(presenter.interactor is CountOfMediaInteractor)
        XCTAssertTrue(presenter.router is CountOfMediaRotuer)
        
        let interactor = presenter.interactor as! CountOfMediaInteractor
        
        XCTAssertNotNil(interactor.presenter)
        XCTAssertNotNil(interactor.settingsUserDefaultsManager)
        XCTAssertTrue(interactor.presenter is CountOfMediaPresenter)
        XCTAssertTrue(interactor.settingsUserDefaultsManager is SettingsUserDefaultsManagerImpl)
        
        let router = presenter.router as! CountOfMediaRotuer
        
        XCTAssertNotNil(router.viewController)
        XCTAssertTrue(router.viewController is CountOfMediaViewController)
    }
    
}
