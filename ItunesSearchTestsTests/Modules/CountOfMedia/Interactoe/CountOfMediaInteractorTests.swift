//
//  CountOfMediaInteractorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class CountOfMediaInteractorTests: XCTestCase {
    
    var countOfMediaInteractor: CountOfMediaInteractor!
    
    override func setUp() {
        super.setUp()
        countOfMediaInteractor = CountOfMediaInteractor()
    }
    
    override func tearDown() {
        countOfMediaInteractor = nil
        super.tearDown()
    }
    
    func testArraySizeShouldBeEndCountMinusStartCountAndPlusOne() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaInteractor.presenter = presenterMock
        let expectedSize = countOfMediaInteractor.endCount - countOfMediaInteractor.startCount + 1
        
        //when
        countOfMediaInteractor.prepareData()
        
        //then
        XCTAssertEqual(countOfMediaInteractor.numberArray.count, expectedSize)
    }
    
    func testWhenPrepareDataThenPresenterDidFinishPrepareDataCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaInteractor.presenter = presenterMock
        
        //when
        countOfMediaInteractor.prepareData()
        
        //then
        XCTAssertTrue(presenterMock.didFinishPrepareDataCalled)
    }
    
    func testWhenGetNumberOfCountThenPresenterDidGettingNumberOfCountCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaInteractor.presenter = presenterMock
        
        //when
        countOfMediaInteractor.getNumberOfCount()
        
        //then
        XCTAssertTrue(presenterMock.didGettingNumberOfCountCalled)
    }
    
    func testWhenGetTitleForRowThenPresenterDidGettingTitleForRowCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaInteractor.presenter = presenterMock
        countOfMediaInteractor.numberArray = [0]
        
        //when
        countOfMediaInteractor.getTitleForRow(at: 0)
        
        //then
        XCTAssertTrue(presenterMock.didGettigTitleForRowCalled)
    }
    
    func testWhenSaveCountOfMediaThenUserDafaultsManagerSaveCountOfResultsCalled() {
        //given
        let settingsUserDafaultsManagerMock = SettingsUserDefaultsManagerMock()
        countOfMediaInteractor.settingsUserDefaultsManager = settingsUserDafaultsManagerMock
        countOfMediaInteractor.numberArray = [5]
        
        //when
        countOfMediaInteractor.saveCountOfMedia(with: 0)
        
        //then
        XCTAssertTrue(settingsUserDafaultsManagerMock.saveCountOfResultsCalled)
    }
    
    func testWhenGetSaveCountOfMediaThenPresenterDidGettingCountOfMediaResultsCalled() {
        //given
        let settingsUserDafaultsManagerMock = SettingsUserDefaultsManagerMock()
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaInteractor.settingsUserDefaultsManager = settingsUserDafaultsManagerMock
        countOfMediaInteractor.presenter = presenterMock
        
        let savedValue = 5
        let nothingSaved = 0
        countOfMediaInteractor.numberArray = [savedValue]
        settingsUserDafaultsManagerMock.save(countOfResults: savedValue)
        
        //when
        countOfMediaInteractor.getSaveCountOfMedia()
        
        //then
        XCTAssertNotEqual(settingsUserDafaultsManagerMock.getCountOfResults(), nothingSaved)
        XCTAssertTrue(presenterMock.didGettingCountOfMediaResultsCalled)
    }
    
}

fileprivate class CountOfMediaPresenterMock: CountOfMediaInteractorOutput {
    
    var didFinishPrepareDataCalled = false
    var didGettingNumberOfCountCalled = false
    var didGettigTitleForRowCalled = false
    var didGettingCountOfMediaResultsCalled = false
    
    func didGettingNumberOfCount(_ number: Int) {
        didGettingNumberOfCountCalled = true
    }
    
    func didGettingTitleForRow(_ title: String) {
        didGettigTitleForRowCalled = true
    }
    
    func didGettingCountOfMediaResults(indexOfResult: Int) {
        didGettingCountOfMediaResultsCalled = true
    }
    
    func didFinishPrepareData() {
        didFinishPrepareDataCalled = true
    }
    
}

fileprivate class SettingsUserDefaultsManagerMock: SettingsUserDefaultsManager {
    
    var savedMediaType: MediaTypes?
    var savedCountOfResults = 0
    var savedDeviceType: DeviceTypes?
    
    var saveCountOfResultsCalled = false
    
    func save(mediaType: MediaTypes) {
        savedMediaType = mediaType
    }
    
    func getMediaType() -> MediaTypes? {
        return savedMediaType
    }
    
    func save(countOfResults: Int) {
        savedCountOfResults = countOfResults
        saveCountOfResultsCalled = true
    }
    
    func getCountOfResults() -> Int {
        return savedCountOfResults
    }
    
    func save(deviceType: DeviceTypes) {
        savedDeviceType = deviceType
    }
    
    func getDeviceType() -> DeviceTypes? {
        return savedDeviceType
    }
    
}
