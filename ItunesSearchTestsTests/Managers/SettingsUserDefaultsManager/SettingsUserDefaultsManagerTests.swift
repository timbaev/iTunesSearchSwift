//
//  SettingsUserDefaultsManager.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SettingsUserDefaultsManagerTests: XCTestCase {
    
    var settingsUserDafaultsManager: SettingsUserDefaultsManagerImpl!
    
    override func setUp() {
        super.setUp()
        settingsUserDafaultsManager = SettingsUserDefaultsManagerImpl()
    }
    
    override func tearDown() {
        settingsUserDafaultsManager = nil
        super.tearDown()
    }
    
    func testThatSaveMediaTypePutValueToUserDefaults() {
        //given
        let userDefaultsMock = UserDefaultsMock()
        settingsUserDafaultsManager.userDefaults = userDefaultsMock
        
        //when
        settingsUserDafaultsManager.save(mediaType: .audiobook)
        
        //then
        XCTAssertTrue(userDefaultsMock.setMediaTypeValueCalled)
    }
    
    func testWhenGetMediaTypeThenUserDefaultsStringForKeyCalled() {
        //given
        let userDefaultsMock = UserDefaultsMock()
        settingsUserDafaultsManager.userDefaults = userDefaultsMock
        
        //when
        let _ = settingsUserDafaultsManager.getMediaType()
        
        //then
        XCTAssertTrue(userDefaultsMock.getMediaTypeValueCalled)
    }
    
    func testThatSaveCountOfResultsPutValueToUserDefaults() {
        //given
        let userDefaultsMock = UserDefaultsMock()
        settingsUserDafaultsManager.userDefaults = userDefaultsMock
        
        //when
        settingsUserDafaultsManager.save(countOfResults: 1)
        
        //then
        XCTAssertTrue(userDefaultsMock.setCountOfResultsCalled)
    }
    
    func testWhenGetCountOfResultsThenUserDefaultsIntegerForKeyCalled() {
        //given
        let userDefaultsMock = UserDefaultsMock()
        settingsUserDafaultsManager.userDefaults = userDefaultsMock
        
        //when
        let _ = settingsUserDafaultsManager.getCountOfResults()
        
        //then
        XCTAssertTrue(userDefaultsMock.getCountOfResultsCalled)
    }
    
    func testThatSaveDeviceTypePutValueToUserDefaults() {
        //given
        let userDefaultsMock = UserDefaultsMock()
        settingsUserDafaultsManager.userDefaults = userDefaultsMock
        
        //when
        settingsUserDafaultsManager.save(deviceType: .all)
        
        //then
        XCTAssertTrue(userDefaultsMock.setDeviceTypCalled)
    }
    
    func testWhenGetDeviceTypeCalledThenUserDefaultsStringForKeyCalled() {
        //given
        let userDefaultsMock = UserDefaultsMock()
        settingsUserDafaultsManager.userDefaults = userDefaultsMock
        
        //when
        let _ = settingsUserDafaultsManager.getDeviceType()
        
        //then
        XCTAssertTrue(userDefaultsMock.getDeviceTypeCalled)
    }
    
}

fileprivate class UserDefaultsMock: UserDefaults {
    
    private let mediaTypeKey = "mediaType"
    private let countKey = "count"
    private let deviceTypeKey = "deviceType"
    
    var setMediaTypeValueCalled = false
    var getMediaTypeValueCalled = false
    var setCountOfResultsCalled = false
    var getCountOfResultsCalled = false
    var setDeviceTypCalled = false
    var getDeviceTypeCalled = false
    
    convenience init() {
        self.init(suiteName: "Mock User Defaults")!
    }
    
    override init?(suiteName suitename: String?) {
        guard let suitename = suitename else { return nil }
        UserDefaults().removePersistentDomain(forName: suitename)
        super.init(suiteName: suitename)
    }
    
    override func set(_ value: Any?, forKey defaultName: String) {
        if defaultName == mediaTypeKey {
            setMediaTypeValueCalled = true
        }
        if defaultName == deviceTypeKey {
            setDeviceTypCalled = true
        }
    }
    
    override func set(_ value: Int, forKey defaultName: String) {
        if defaultName == countKey {
            setCountOfResultsCalled = true
        }
    }
    
    override func string(forKey defaultName: String) -> String? {
        if defaultName == mediaTypeKey {
            getMediaTypeValueCalled = true
        }
        if defaultName == deviceTypeKey {
            getDeviceTypeCalled = true
        }
        return nil
    }
    
    override func integer(forKey defaultName: String) -> Int {
        if defaultName == countKey {
            getCountOfResultsCalled = true
        }
        return 0
    }
    
}
