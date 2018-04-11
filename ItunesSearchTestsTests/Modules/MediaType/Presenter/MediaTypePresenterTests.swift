//
//  MediaTypePresenterTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class MediaTypePresenterTests: XCTestCase {
    
    var mediaTypePresenter: MediaTypePresenter!
    
    override func setUp() {
        super.setUp()
        mediaTypePresenter = MediaTypePresenter()
    }
    
    override func tearDown() {
        mediaTypePresenter = nil
        super.tearDown()
    }
    
    func testWhenViewIsReadyThenPrepareMediaTypesCalled() {
        //given
        let interactorMock = MediaTypeInteractorMock()
        mediaTypePresenter.interactor = interactorMock
        
        //when
        mediaTypePresenter.viewIsReady()
        
        //then
        XCTAssertTrue(interactorMock.prepareMediaTypesCalled)
    }
    
    func testWhenOnViewDidAppearThenPrepareCheckmarkCalled() {
        //given
        let interactorMock = MediaTypeInteractorMock()
        mediaTypePresenter.interactor = interactorMock
        
        //when
        mediaTypePresenter.onViewDidAppear()
        
        //then
        XCTAssertTrue(interactorMock.prepareCheckmarkCalled)
    }
    
    func testWhenGetCountOfMediaTypesThenGetCountOfMediaTypesCalled() {
        //given
        let interactorMock = MediaTypeInteractorMock()
        mediaTypePresenter.interactor = interactorMock
        
        //when
        mediaTypePresenter.getCountOfMediaTypes()
        
        //then
        XCTAssertTrue(interactorMock.getCountOfMediaTypesCalled)
    }
    
    func testWhenUpdateMediaTypeTitleThenGetTitleForMediaTypeCalled() {
        //given
        let interactorMock = MediaTypeInteractorMock()
        mediaTypePresenter.interactor = interactorMock
        
        //when
        mediaTypePresenter.updateMediaTypeTitle(at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(interactorMock.getTitleForMediaTypeCalled)
    }
    
    func testWhenDidSelectMediaTypeThenSetCheckedCellAndSavedMediaTypeSettingCalled() {
        //given
        let viewMock = MediaTypeViewMock()
        let interactorMock = MediaTypeInteractorMock()
        mediaTypePresenter.view = viewMock
        mediaTypePresenter.interactor = interactorMock
        
        //when
        mediaTypePresenter.didSelectMediaType(at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(viewMock.setCheckedCellCalled)
        XCTAssertTrue(interactorMock.saveMediaTypeSettingCalled)
    }
    
    func testDidSelectMediaTypeIfLastCheckedIndexPathExists() {
        //given
        let viewMock = MediaTypeViewMock()
        let interactorMock = MediaTypeInteractorMock()
        mediaTypePresenter.view = viewMock
        mediaTypePresenter.interactor = interactorMock
        mediaTypePresenter.lastCheckedIndexPath = IndexPath(row: 0, section: 0)
        
        //when
        mediaTypePresenter.didSelectMediaType(at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(viewMock.setUncheckedCellCalled)
    }
    
    func testWhenDidGetCountOfMediaTypesThenSetNumberOfRowsCalled() {
        //given
        let viewMock = MediaTypeViewMock()
        mediaTypePresenter.view = viewMock
        
        //when
        mediaTypePresenter.didGetCountOfMediaTypes(0)
        
        //then
        XCTAssertTrue(viewMock.setNumberOfRowsCalled)
    }
    
    func testWhenDidGetTitleForMediaTypeThenSetMediaTitleCalled() {
        //given
        let viewMock = MediaTypeViewMock()
        mediaTypePresenter.view = viewMock
        
        //when
        mediaTypePresenter.didGetTitleForMediaType("Title here")
        
        //then
        XCTAssertTrue(viewMock.setMediaTitleCalled)
    }
    
    func testWhensetCheckedCellThenViewSetCheckedCellCalled() {
        //given
        let viewMock = MediaTypeViewMock()
        mediaTypePresenter.view = viewMock
        
        //when
        mediaTypePresenter.setCheckedCell(at: 0)
        
        //then
        XCTAssertTrue(viewMock.setCheckedCellCalled)
    }
    
}

fileprivate class MediaTypeViewMock: MediaTypeViewInput {
    
    var setCheckedCellCalled = false
    var setUncheckedCellCalled = false
    var setNumberOfRowsCalled = false
    var setMediaTitleCalled = false
    
    func set(numberOfRows currentNumberOfRows: Int) {
        setNumberOfRowsCalled = true
    }
    
    func set(mediaTitle currentMediaTitle: String) {
        setMediaTitleCalled = true
    }
    
    func setCheckedCell(at indexPath: IndexPath) {
        setCheckedCellCalled = true
    }
    
    func setUncheckedCell(at indexPath: IndexPath) {
        setUncheckedCellCalled = true
    }
    
}

fileprivate class MediaTypeInteractorMock: MediaTypeInteractorInput {
    
    var prepareMediaTypesCalled = false
    var prepareCheckmarkCalled = false
    var getCountOfMediaTypesCalled = false
    var getTitleForMediaTypeCalled = false
    var saveMediaTypeSettingCalled = false
    
    func getCountOfMediaTypes() {
        getCountOfMediaTypesCalled = true
    }
    
    func getTitleForMediaType(at index: Int) {
        getTitleForMediaTypeCalled = true
    }
    
    func prepareMediaTypes() {
        prepareMediaTypesCalled = true
    }
    
    func saveMediaTypeSetting(with index: Int) {
        saveMediaTypeSettingCalled = true
    }
    
    func prepareCheckmark() {
        prepareCheckmarkCalled = true
    }
    
}
