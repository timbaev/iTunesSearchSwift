//
//  MediaTypeInteractorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class MediaTypeInteractorTests: XCTestCase {
    
    var mediaTypeInteractor: MediaTypeInteractor!
    
    override func setUp() {
        super.setUp()
        mediaTypeInteractor = MediaTypeInteractor()
    }
    
    override func tearDown() {
        mediaTypeInteractor = nil
        super.tearDown()
    }
    
    func testPrepareMediaTypesExpectedAllValues() {
        //given
        let exptectedValues = MediaTypes.allValues
        
        //when
        mediaTypeInteractor.prepareMediaTypes()
        
        //then
        XCTAssertEqual(exptectedValues, mediaTypeInteractor.mediaTypes)
    }
    
    func testPrepareCheckmarkIfValueNotExists() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        let presenterMock = MediaTypePresenterMock()
        mediaTypeInteractor.presenter = presenterMock
        mediaTypeInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        
        //when
        mediaTypeInteractor.prepareCheckmark()
        
        //then
        XCTAssertNil(settingsUserDefaultsManagerMock.getMediaType())
        XCTAssertTrue(presenterMock.setCheckedCellCalledWithDefaultValue)
    }
    
    func testPrepareCheckmarkIfValueExists() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        let presenterMock = MediaTypePresenterMock()
        mediaTypeInteractor.presenter = presenterMock
        mediaTypeInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        mediaTypeInteractor.mediaTypes = MediaTypes.allValues
        
        //when
        settingsUserDefaultsManagerMock.save(mediaType: .audiobook)
        mediaTypeInteractor.prepareCheckmark()
        
        //then
        XCTAssertNotNil(settingsUserDefaultsManagerMock.getMediaType())
        XCTAssertTrue(presenterMock.setCheckedCellCalled)
    }
    
    func testWhenGetCountOfMediaTypesThenDidGetCountOfMediaTypesCalled() {
        //given
        let presenterMock = MediaTypePresenterMock()
        mediaTypeInteractor.presenter = presenterMock
        
        //when
        mediaTypeInteractor.getCountOfMediaTypes()
        
        //then
        XCTAssertTrue(presenterMock.didGetCountOfMediaTypesCalled)
    }
    
    func testGetTitleForMediaTypeWithIndex() {
        //given
        let presenterMock = MediaTypePresenterMock()
        mediaTypeInteractor.presenter = presenterMock
        mediaTypeInteractor.mediaTypes = [.audiobook]
        let expectedTitle = MediaTypes.audiobook.rawValue
        
        //when
        mediaTypeInteractor.getTitleForMediaType(at: 0)
        
        //then
        XCTAssertNotNil(presenterMock.arrivedMediaTypeTitle)
        XCTAssertEqual(expectedTitle, presenterMock.arrivedMediaTypeTitle)
    }
    
    func testWhenSaveMediaTypeSettingThenGetMediaTypeReturnEqualMediaType() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        mediaTypeInteractor.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        mediaTypeInteractor.mediaTypes = [.audiobook]
        let expectedMediaType = MediaTypes.audiobook
        
        //when
        mediaTypeInteractor.saveMediaTypeSetting(with: 0)
        
        //then
        XCTAssertEqual(expectedMediaType, settingsUserDefaultsManagerMock.getMediaType())
    }
    
}

fileprivate class SettingsUserDefaultsManagerMock: SettingsUserDefaultsManager {
    
    var savedMediaType: MediaTypes?
    var savedCountOfResults = 0
    var savedDeviceType: DeviceTypes?
    
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
    }
    
    func getDeviceType() -> DeviceTypes? {
        return savedDeviceType
    }
    
}

fileprivate class MediaTypePresenterMock: MediaTypeInteractorOutput {
    
    private let defaultValue = 0
    var setCheckedCellCalledWithDefaultValue = false
    var setCheckedCellCalled = false
    var didGetCountOfMediaTypesCalled = false
    var arrivedMediaTypeTitle: String!
    
    func didGetCountOfMediaTypes(_ count: Int) {
        didGetCountOfMediaTypesCalled = true
    }
    
    func didGetTitleForMediaType(_ title: String) {
        arrivedMediaTypeTitle = title
    }
    
    func setCheckedCell(at index: Int) {
        if index == defaultValue {
            setCheckedCellCalledWithDefaultValue = true
        } else {
            setCheckedCellCalled = true
        }
    }
    
}
