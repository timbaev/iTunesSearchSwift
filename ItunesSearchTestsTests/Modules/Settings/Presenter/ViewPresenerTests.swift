//
//  ViewPresenerTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 10.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class ViewPresenerTests: XCTestCase {
    
    var settingsPresenter: SettingsPreseter!
    
    override func setUp() {
        super.setUp()
        settingsPresenter = SettingsPreseter()
    }
    
    override func tearDown() {
        settingsPresenter = nil
        super.tearDown()
    }
    
    func testWhenViewIsReadyThenPrepareTableViewCalled() {
        //given
        let viewMock = SettingsViewMock()
        settingsPresenter.view = viewMock
        
        //when
        settingsPresenter.viewIsReady()
        
        //then
        XCTAssertTrue(viewMock.prepareTableViewCalled)
    }
    
    func testWhenOnViewWillAppearThenPrepareSettingsScreenCalled() {
        //given
        let interactorMock = SettingsInteractorMock()
        settingsPresenter.interactor = interactorMock
        
        //when
        settingsPresenter.onViewWillAppear()
        
        //then
        XCTAssertTrue(interactorMock.prepareSettingsScreenCalled)
    }
    
    func testWhenDidSelectSettingRowThenShowExpectedRouterScreen() {
        //given
        let routerMock = SettingsRouterMock()
        settingsPresenter.router = routerMock
        
        let mediaTypeScreenIndexPath = IndexPath(row: 0, section: 0)
        let countOfMediaScreenIndexPath = IndexPath(row: 1, section: 0)
        let deviceTypeScreenIndexPath = IndexPath(row: 0, section: 1)
        
        let mediaTypeScreenShowExpected = true
        let countOfMediaScreenShowExpected = true
        let deviceTypeScreenShowExpected = true
        
        //when
        settingsPresenter.didSelectSettingRow(at: mediaTypeScreenIndexPath)
        settingsPresenter.didSelectSettingRow(at: countOfMediaScreenIndexPath)
        settingsPresenter.didSelectSettingRow(at: deviceTypeScreenIndexPath)
        
        //then
        XCTAssertEqual(mediaTypeScreenShowExpected, routerMock.mediaTypeScreenShowed)
        XCTAssertEqual(countOfMediaScreenShowExpected, routerMock.countOfMediaScreenShowed)
        XCTAssertEqual(deviceTypeScreenShowExpected, routerMock.deviceTypeScreenShowed)
    }
    
}

class SettingsViewMock: SettingsViewInput {
    
    var prepareTableViewCalled = false
    
    func set(mediaTypeTitle title: String) {
        
    }
    
    func set(countOfMediaResultsTitle title: String) {
        
    }
    
    func set(deviceTypeTitle title: String) {
        
    }
    
    func prepareTableView() {
        prepareTableViewCalled = true
    }
    
}

class SettingsInteractorMock: SettingsInteractorInput {
    
    var prepareSettingsScreenCalled = false
    
    func prepareSettingsScrren() {
        prepareSettingsScreenCalled = true
    }

}

class SettingsRouterMock: SettingsRouterInput {
    
    var mediaTypeScreenShowed = false
    var countOfMediaScreenShowed = false
    var deviceTypeScreenShowed = false
    
    func showMediaTypesScreen() {
        mediaTypeScreenShowed = true
    }
    
    func showCountOfMediaScreen() {
        countOfMediaScreenShowed = true
    }
    
    func showDeviceTypeScreen() {
        deviceTypeScreenShowed = true
    }
    
}
