//
//  SearchMediaConfiguratorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SearchMediaConfiguratorTests: XCTestCase {
    
    var searchMediaInitializer: SearchMediaInitializer!
    
    override func setUp() {
        super.setUp()
        searchMediaInitializer = SearchMediaInitializer()
    }
    
    override func tearDown() {
        searchMediaInitializer = nil
        super.tearDown()
    }
    
    func testSetupModule() {
        //given
        let viewController = SearchMediaViewController()
        searchMediaInitializer.viewController = viewController
        
        //when
        searchMediaInitializer.awakeFromNib()
        
        //then
        XCTAssertNotNil(viewController.presenter)
        XCTAssertTrue(viewController.presenter is SearchMediaPresenter)
        
        let presenter = viewController.presenter as! SearchMediaPresenter
        
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.view is SearchMediaViewController)
        XCTAssertTrue(presenter.interactor is SearchMediaInteractor)
        XCTAssertTrue(presenter.router is SearchMediaRouter)
        
        let interactor = presenter.interactor as! SearchMediaInteractor
        
        XCTAssertNotNil(interactor.presenter)
        XCTAssertNotNil(interactor.settingsUserDefaultsManager)
        XCTAssertNotNil(interactor.mediaServie)
        XCTAssertNotNil(interactor.imageDownloadManager)
        XCTAssertTrue(interactor.presenter is SearchMediaPresenter)
        XCTAssertTrue(interactor.settingsUserDefaultsManager is SettingsUserDefaultsManagerImpl)
        XCTAssertTrue(interactor.mediaServie is MediaServiceImpl)
        XCTAssertTrue(interactor.imageDownloadManager is ImageDownloadManagerImpl)
        
        let router = presenter.router as! SearchMediaRouter
        
        XCTAssertNotNil(router.viewController)
        XCTAssertNotNil(router.commonAlertsFactory)
        XCTAssertTrue(router.viewController is SearchMediaViewController)
        XCTAssertTrue(router.commonAlertsFactory is CommonAlertsFactoryImpl)
    }
    
}
