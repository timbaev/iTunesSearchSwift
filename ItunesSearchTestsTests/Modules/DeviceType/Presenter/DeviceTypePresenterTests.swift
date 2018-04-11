//
//  DeviceTypePresenterTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class DeviceTypePresenterTests: XCTestCase {
    
    var deviceTypePresenter: DeviceTypePresenter!
    
    override func setUp() {
        super.setUp()
        deviceTypePresenter = DeviceTypePresenter()
    }
    
    override func tearDown() {
        deviceTypePresenter = nil
        super.tearDown()
    }
    
    func testWhenViewIsReadyThenInteractorPrepareDataCalled() {
        //given
        let interactorMock = DeviceTypeInteractorMock()
        deviceTypePresenter.interactor = interactorMock
        
        //when
        deviceTypePresenter.viewIsReady()
        
        //then
        XCTAssertTrue(interactorMock.prepareDataCalled)
    }
    
    func testWhenOnViewDidAppearThenInteractorPrepareCheckmarkCalled() {
        //given
        let interactorMock = DeviceTypeInteractorMock()
        deviceTypePresenter.interactor = interactorMock
        
        //when
        deviceTypePresenter.onViewDidAppear()
        
        //then
        XCTAssertTrue(interactorMock.prepareCheckmarkCalled)
    }
    
    func testWhenUpdateNumberOfRowsThenInteractorUpdateNumberOfRowsCalled() {
        //given
        let interactorMock = DeviceTypeInteractorMock()
        deviceTypePresenter.interactor = interactorMock
        
        //when
        deviceTypePresenter.updateNumberOfRows()
        
        //then
        XCTAssertTrue(interactorMock.updateNumberOfRowsCalled)
    }
    
    func testWhenUpdateTitleThenInteractorUpdateTitleCalled() {
        //given
        let interactorMock = DeviceTypeInteractorMock()
        deviceTypePresenter.interactor = interactorMock
        
        //when
        deviceTypePresenter.updateTitle(at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(interactorMock.updateTitleCalled)
    }
    
    func testWhenDidSelectMediaTypeThenSetCheckedCellAndSavedMediaTypeSettingCalled() {
        //given
        let viewMock = DeviceTypeViewMock()
        let interactorMock = DeviceTypeInteractorMock()
        deviceTypePresenter.view = viewMock
        deviceTypePresenter.interactor = interactorMock
        
        //when
        deviceTypePresenter.didSelectDeviceType(at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(viewMock.setCheckedCellCalled)
        XCTAssertTrue(interactorMock.saveDeviceTypeSettingCalled)
    }
    
    func testDidSelectMediaTypeIfLastCheckedIndexPathExists() {
        //given
        let viewMock = DeviceTypeViewMock()
        let interactorMock = DeviceTypeInteractorMock()
        deviceTypePresenter.view = viewMock
        deviceTypePresenter.interactor = interactorMock
        deviceTypePresenter.lastCheckedIndexPath = IndexPath(row: 0, section: 0)
        
        //when
        deviceTypePresenter.didSelectDeviceType(at: IndexPath(row: 1, section: 0))
        
        //then
        XCTAssertTrue(viewMock.setUncheckedCellCalled)
    }
    
    func testWhenDidUpdateNumberOfRowsThenViewSetNumberOfRowsCalled() {
        //given
        let viewMock = DeviceTypeViewMock()
        deviceTypePresenter.view = viewMock
        
        //when
        deviceTypePresenter.didUpdateNumberOfRows(0)
        
        //then
        XCTAssertTrue(viewMock.setNumberOfRowsCalled)
    }
    
    func testWhenDidUpdateTitleThenViewSetCurrentTitleCalled() {
        //given
        let viewMock = DeviceTypeViewMock()
        deviceTypePresenter.view = viewMock
        
        //when
        deviceTypePresenter.didUpdateTitle("Viper unit tests - is boring :(")
        
        //then
        XCTAssertTrue(viewMock.setCurrentTitleCalled)
    }
    
    func testWhenDidUpdateCheckmarkThenViewSetCheckedCellCalled() {
        //given
        let viewMock = DeviceTypeViewMock()
        deviceTypePresenter.view = viewMock
        
        //when
        deviceTypePresenter.didUpdateCheckmark(at: 0)
        
        //then
        XCTAssertTrue(viewMock.setCheckedCellCalled)
    }
    
}

fileprivate class DeviceTypeInteractorMock: DeviceTypeInteractorInput {
    
    var prepareDataCalled = false
    var prepareCheckmarkCalled = false
    var updateNumberOfRowsCalled = false
    var updateTitleCalled = false
    var saveDeviceTypeSettingCalled = false
    
    func prepareData() {
        prepareDataCalled = true
    }
    
    func updateNumberOfRows() {
        updateNumberOfRowsCalled = true
    }
    
    func updateTitle(at index: Int) {
        updateTitleCalled = true
    }
    
    func prepareCheckmark() {
        prepareCheckmarkCalled = true
    }
    
    func saveDeviceTypeSetting(with index: Int) {
        saveDeviceTypeSettingCalled = true
    }
    
}

fileprivate class DeviceTypeViewMock: DeviceTypeViewInput {
    
    var setCheckedCellCalled = false
    var setUncheckedCellCalled = false
    var setNumberOfRowsCalled = false
    var setCurrentTitleCalled = false
    
    func set(numberOfRows number: Int) {
        setNumberOfRowsCalled = true
    }
    
    func set(currentTitle title: String) {
        setCurrentTitleCalled = true
    }
    
    func setCheckedCell(at indexPath: IndexPath) {
        setCheckedCellCalled = true
    }
    
    func setUncheckedCell(at indexPath: IndexPath) {
        setUncheckedCellCalled = true
    }

}
