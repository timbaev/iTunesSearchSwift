//
//  SettingsInteractorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 10.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SettingsInteractorTests: XCTestCase {
    
    var settingsInteractor: SettingsInteractor!
    
    override func setUp() {
        super.setUp()
        settingsInteractor = SettingsInteractor()
    }
    
    override func tearDown() {
        settingsInteractor = nil
        super.tearDown()
    }
    
    func testWhenGetSavedMediaTypeThenDidGetSavedMediaTypeCalled() {
        //given
        let presenterMock = SettingsPresenterMock()
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        settingsInteractor.presenter = presenterMock
        settingsInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        
        //when
        settingsInteractor.getSavedMediaType()
        
        //then
        XCTAssertTrue(presenterMock.getSavedMediaTypeCalled)
    }
    
    func testWhenGetSavedCountOfResultsThenDidGettingSavedCountOfResultsCalled() {
        //given
        let presenterMock = SettingsPresenterMock()
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        settingsInteractor.presenter = presenterMock
        settingsInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        
        //when
        settingsInteractor.getSavedCountOfResults()
        
        //then
        XCTAssertTrue(presenterMock.getSavedCountOfResultsCalled)
    }
    
    func testWhenGetSavedDeviceTypeThenDidGetSavedDeviceTypeCalled() {
        //given
        let presenterMock = SettingsPresenterMock()
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        settingsInteractor.presenter = presenterMock
        settingsInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        
        //when
        settingsInteractor.getSavedDeviceType()
        
        //then
        XCTAssertTrue(presenterMock.getSavedDeviceTypeCalled)
    }
    
}

fileprivate class SettingsPresenterMock: SettingsInteractorOutput {
    
    var getSavedMediaTypeCalled = false
    var getSavedCountOfResultsCalled = false
    var getSavedDeviceTypeCalled = false
    
    func didGetSavedMediaType(_ mediaType: MediaTypes) {
        getSavedMediaTypeCalled = true
    }
    
    func didGettingSavedCountOfResults(_ count: Int) {
        getSavedCountOfResultsCalled = true
    }
    
    func didGetSavedDeviceType(_ deviceType: DeviceTypes) {
        getSavedDeviceTypeCalled = true
    }
    
}

fileprivate class SettingsUserDefaultsManagerMock: SettingsUserDefaultsManager {
    
    let userDefaults = UserDefaults.standard
    
    func save(mediaType: MediaTypes) {
        
    }
    
    func getMediaType() -> MediaTypes? {
        return MediaTypes.movie
    }
    
    func save(countOfResults: Int) {
        
    }
    
    func getCountOfResults() -> Int {
        return 1
    }
    
    func save(deviceType: DeviceTypes) {
        
    }
    
    func getDeviceType() -> DeviceTypes? {
        return DeviceTypes.iPhone
    }
    
}
