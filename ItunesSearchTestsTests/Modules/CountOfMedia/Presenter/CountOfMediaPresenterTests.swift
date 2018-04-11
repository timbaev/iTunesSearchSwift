//
//  CountOfMediaPresenterTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class CountOfMediaPresenterTests: XCTestCase {
    
    var countOfMediaPresenter: CountOfMediaPresenter!
    
    override func setUp() {
        super.setUp()
        countOfMediaPresenter = CountOfMediaPresenter()
    }
    
    override func tearDown() {
        countOfMediaPresenter = nil
        super.tearDown()
    }
    
    func testWhenViewIsReadyThenInteractorPrepareDataCalled() {
        //given
        let interactorMock = CountOfMediaInteractorMock()
        countOfMediaPresenter.interactor = interactorMock
        
        //when
        countOfMediaPresenter.viewIsReady()
        
        //then
        XCTAssertTrue(interactorMock.prepareDataCalled)
    }
    
    func testWhenOnViewWillAppearThenInteractorGetSaveCountOfMediaCalled() {
        //given
        let interactorMock = CountOfMediaInteractorMock()
        countOfMediaPresenter.interactor = interactorMock
        
        //when
        countOfMediaPresenter.onViewWillAppear()
        
        //then
        XCTAssertTrue(interactorMock.getSaveCountOfMediaCalled)
    }
    
    func testWhenUpdateNumberOfComponentsThenViewSetNumberOfComponentsCalled() {
        //given
        let viewMock = CountOfMediaViewMock()
        countOfMediaPresenter.view = viewMock
        
        //when
        countOfMediaPresenter.updateNumberOfComponents()
        
        //then
        XCTAssertTrue(viewMock.setNumberOfComponentsCalled)
    }
    
    func testWhenUpdateNumberOfRowsThenInteractorGetNumberOfCountsCalled() {
        //given
        let interactorMock = CountOfMediaInteractorMock()
        countOfMediaPresenter.interactor = interactorMock
        
        //when
        countOfMediaPresenter.updateNumberOfRows()
        
        //then
        XCTAssertTrue(interactorMock.getNumberOfCountsCalled)
    }
    
    func testWhenUpdateTitleForRowThenInteractorGetTitleForRowCalled() {
        //given
        let interactorMock = CountOfMediaInteractorMock()
        countOfMediaPresenter.interactor = interactorMock
        
        //when
        countOfMediaPresenter.updateTitleForRow(for: 0)
        
        //then
        XCTAssertTrue(interactorMock.getTitleForRowCalled)
    }
    
    func testWhenDidSelectCountOfMediaThenInteractorSaveCountOfMediaCalled() {
        //given
        let interactorMock = CountOfMediaInteractorMock()
        countOfMediaPresenter.interactor = interactorMock
        
        //when
        countOfMediaPresenter.didSelectCountOfMedia(at: 0)
        
        //then
        XCTAssertTrue(interactorMock.saveCountOfMediaCalled)
    }
    
    func testWhenDidGettingNumberOfCountThenViewSetNumberOfRowsCalled() {
        //given
        let viewMock = CountOfMediaViewMock()
        countOfMediaPresenter.view = viewMock
        
        //when
        countOfMediaPresenter.didGettingNumberOfCount(0)
        
        //then
        XCTAssertTrue(viewMock.setNumberOfRowsCalled)
    }
    
    func testWhenDidGettingTitleForRowThenViewSetTitleOfRowCalled() {
        //given
        let viewMock = CountOfMediaViewMock()
        countOfMediaPresenter.view = viewMock
        
        //when
        countOfMediaPresenter.didGettingTitleForRow("Hello, Swift!")
        
        //then
        XCTAssertTrue(viewMock.setTitleFoRowsCalled)
    }
    
    func testWhenDidGettingCountOfMediaResultsThenViewSetSelectedRowCalled() {
        //given
        let viewMock = CountOfMediaViewMock()
        countOfMediaPresenter.view = viewMock
        
        //when
        countOfMediaPresenter.didGettingCountOfMediaResults(indexOfResult: 0)
        
        //then
        XCTAssertTrue(viewMock.setSelectedRowCalled)
    }
    
    func testWhenDidFinishPrepareDataThenViewPreparePickerViewCalled() {
        //given
        let viewMock = CountOfMediaViewMock()
        countOfMediaPresenter.view = viewMock
        
        //when
        countOfMediaPresenter.didFinishPrepareData()
        
        //then
        XCTAssertTrue(viewMock.preparePickerViewCalled)
    }
    
}

fileprivate class CountOfMediaViewMock: CountOfmediaViewInput {
    
    var setNumberOfComponentsCalled = false
    var setNumberOfRowsCalled = false
    var setTitleFoRowsCalled = false
    var setSelectedRowCalled = false
    var preparePickerViewCalled = false
    
    func set(numberOfComponents currentNumber: Int) {
        setNumberOfComponentsCalled = true
    }
    
    func set(numberOfRows currentNumber: Int) {
        setNumberOfRowsCalled = true
    }
    
    func set(titleOfRow currentTitle: String) {
        setTitleFoRowsCalled = true
    }
    
    func set(selectedRow indexOfRow: Int) {
        setSelectedRowCalled = true
    }
    
    func preparePickerView() {
        preparePickerViewCalled = true
    }
    
}

fileprivate class CountOfMediaInteractorMock: CountOfMediaInteractorInput {
    
    var prepareDataCalled = false
    var getSaveCountOfMediaCalled = false
    var getNumberOfCountsCalled = false
    var getTitleForRowCalled = false
    var saveCountOfMediaCalled = false
    
    func prepareData() {
        prepareDataCalled = true
    }
    
    func getNumberOfCount() {
        getNumberOfCountsCalled = true
    }
    
    func getTitleForRow(at index: Int) {
        getTitleForRowCalled = true
    }
    
    func saveCountOfMedia(with index: Int) {
        saveCountOfMediaCalled = true
    }
    
    func getSaveCountOfMedia() {
        getSaveCountOfMediaCalled = true
    }
    
}
