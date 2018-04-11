//
//  DeviceTypeInteractorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class DeviceTypeInteractorTests: XCTestCase {
    
    var deviceTypeInteractor: DeviceTypeInteractor!
    
    override func setUp() {
        super.setUp()
        deviceTypeInteractor = DeviceTypeInteractor()
    }
    
    override func tearDown() {
        deviceTypeInteractor = nil
        super.tearDown()
    }
    
    func testThatPrepareDataSetupAllEnumValues() {
        //given
        let expectedValues = DeviceTypes.allValues
        
        //when
        deviceTypeInteractor.prepareData()
        
        //then
        XCTAssertEqual(expectedValues, deviceTypeInteractor.deviceTypes)
    }
    
    func testThatPrepareCheckmarkCallPresenterDidUpdateCheckmarkWithDefaultValueIfDeviceTypeNotExists() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        deviceTypeInteractor.presenter = presenterMock
        
        deviceTypeInteractor.defaultCheckmarkPosition = presenterMock.defaultCheckmarkPosition
        
        //when
        deviceTypeInteractor.prepareCheckmark()
        
        //then
        XCTAssertTrue(presenterMock.didUpdateCheckmarkCalledWithDefaultPostion)
        XCTAssertFalse(presenterMock.didUpdateCheckmarkCalled)
    }
    
    func testThatPrepareCheckmarkCallPresenterDidUpdateCheckmarkIfDeviceTypeExists() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        deviceTypeInteractor.presenter = presenterMock
        
        deviceTypeInteractor.deviceTypes = DeviceTypes.allValues
        deviceTypeInteractor.defaultCheckmarkPosition = presenterMock.defaultCheckmarkPosition
        settingsUserDefaultsManagerMock.save(deviceType: .iPhone)
        
        //when
        deviceTypeInteractor.prepareCheckmark()
        
        //then
        XCTAssertTrue(presenterMock.didUpdateCheckmarkCalled)
        XCTAssertFalse(presenterMock.didUpdateCheckmarkCalledWithDefaultPostion)
    }
    
    func testWhenUpdateNumberOfRowsThenPresenterDidUpdateNumberOfRowsCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeInteractor.presenter = presenterMock
        
        deviceTypeInteractor.deviceTypes = DeviceTypes.allValues
        
        //when
        deviceTypeInteractor.updateNumberOfRows()
        
        //then
        XCTAssertTrue(presenterMock.didUpdateNumberOfRowsCalled)
    }
    
    func testWhenUpdateTitleThenPresenterDidUpdateTitleCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeInteractor.presenter = presenterMock
        
        deviceTypeInteractor.deviceTypes = DeviceTypes.allValues
        
        //when
        deviceTypeInteractor.updateTitle(at: 0)
        
        //then
        XCTAssertTrue(presenterMock.didUpdateTitleCalled)
    }
    
    func testWhenSaveDeviceTypeSettingThenUserDefaultsSaveDeviceTypeCalled() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        deviceTypeInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        
        deviceTypeInteractor.deviceTypes = DeviceTypes.allValues
        
        //when
        deviceTypeInteractor.saveDeviceTypeSetting(with: 0)
        
        //then
        XCTAssertTrue(settingsUserDefaultsManagerMock.saveDeviceTypeCalled)
    }
    
}

fileprivate class DeviceTypePresenterMock: DeviceTypeInteractorOutput {
    
    let defaultCheckmarkPosition = -1
    
    var didUpdateCheckmarkCalledWithDefaultPostion = false
    var didUpdateCheckmarkCalled = false
    var didUpdateNumberOfRowsCalled = false
    var didUpdateTitleCalled = false
    
    func didUpdateNumberOfRows(_ count: Int) {
        didUpdateNumberOfRowsCalled = true
    }
    
    func didUpdateTitle(_ title: String) {
        didUpdateTitleCalled = true
    }
    
    func didUpdateCheckmark(at index: Int) {
        if index == defaultCheckmarkPosition {
            didUpdateCheckmarkCalledWithDefaultPostion = true
        } else {
            didUpdateCheckmarkCalled = true
        }
    }
    
}

fileprivate class SettingsUserDefaultsManagerMock: SettingsUserDefaultsManager {
    
    var savedMediaType: MediaTypes?
    var savedCountOfResults = 0
    var savedDeviceType: DeviceTypes?
    
    var saveDeviceTypeCalled = false
    
    func save(mediaType: MediaTypes) {
        savedMediaType = mediaType
    }
    
    func getMediaType() -> MediaTypes? {
        return savedMediaType
    }
    
    func save(countOfResults: Int) {
        savedCountOfResults = countOfResults
    }
    
    func getCountOfResults() -> Int {
        return savedCountOfResults
    }
    
    func save(deviceType: DeviceTypes) {
        savedDeviceType = deviceType
        saveDeviceTypeCalled = true
    }
    
    func getDeviceType() -> DeviceTypes? {
        return savedDeviceType
    }
    
}


