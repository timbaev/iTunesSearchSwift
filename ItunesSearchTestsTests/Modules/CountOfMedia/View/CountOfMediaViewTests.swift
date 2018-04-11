//
//  CountOfMediaViewTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class CountOfMediaViewTests: XCTestCase {
    
    var countOfMediaView: CountOfMediaViewController!
    
    override func setUp() {
        super.setUp()
        countOfMediaView = CountOfMediaViewController()
    }
    
    override func tearDown() {
        countOfMediaView = nil
        super.tearDown()
    }
    
    func testWhenViewDidLoadThenViewIsReadyCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        countOfMediaView.viewDidLoad()
       
        //then
        XCTAssertTrue(presenterMock.viewIsReadyCalled)
    }
    
    func testWhenViewWillAppearThenOnViewWillAppearCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        countOfMediaView.viewWillAppear(false)
        
        //then
        XCTAssertTrue(presenterMock.onViewWillAppearCalled)
    }
    
    func testThatPreparePickerViewSetupDelegateAndDatasource() {
        //given
        let pickerView = UIPickerView()
        countOfMediaView.countPickerView = pickerView
        
        //when
        countOfMediaView.preparePickerView()
        
        //then
        XCTAssertNotNil(pickerView.delegate)
        XCTAssertNotNil(pickerView.dataSource)
        XCTAssertTrue(pickerView.delegate is CountOfMediaViewController)
        XCTAssertTrue(pickerView.dataSource is CountOfMediaViewController)
    }
    
    func testThatSetNumberOfComponentsSetsCorrectValue() {
        //given
        let expectedNumberOfComponents = 1
    
        //when
        countOfMediaView.set(numberOfComponents: expectedNumberOfComponents)
        
        //then
        XCTAssertNotNil(countOfMediaView.currentNumberOfComponents)
        XCTAssertEqual(countOfMediaView.currentNumberOfComponents, expectedNumberOfComponents)
    }
    
    func  testThatSetNumberOfRowsSetsCorrectValue() {
        //given
        let expectedNumberOfRows = 5
        
        //when
        countOfMediaView.set(numberOfRows: expectedNumberOfRows)
        
        //then
        XCTAssertNotNil(countOfMediaView.currentNumberOfCountRows)
        XCTAssertEqual(expectedNumberOfRows, countOfMediaView.currentNumberOfCountRows)
    }
    
    func testThatSetTitleOFRowsSetsCorrectValue() {
        //given
        let expectedTitleOfRow = "Hello, World!"
        
        //when
        countOfMediaView.set(titleOfRow: expectedTitleOfRow)
        
        //then
        XCTAssertNotNil(countOfMediaView.currentTitleOfRow)
        XCTAssertEqual(expectedTitleOfRow, countOfMediaView.currentTitleOfRow)
    }
    
    func testThatSetSelectedRowSetsCorrectValue() {
        //given
        let expectedSelectedRow = 5
        let picketView = UIPickerView()
        picketView.delegate = countOfMediaView
        picketView.dataSource = countOfMediaView
        countOfMediaView.countPickerView = picketView
        countOfMediaView.currentNumberOfCountRows = 6
        countOfMediaView.currentNumberOfComponents = 1
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        countOfMediaView.set(selectedRow: expectedSelectedRow)
        
        //then
        XCTAssertEqual(expectedSelectedRow, picketView.selectedRow(inComponent: 0))
    }
    
    func testWhenNumberOfComponentsThenPresenterUpdateNumberOfComponentsCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        let _ = countOfMediaView.numberOfComponents(in: UIPickerView())
        
        //then
        XCTAssertTrue(presenterMock.updateNumberOfComponentsCalled)
    }
    
    func testWhenNumberOfRowsInComponentThenPresenterUpdateNumberOfRowsCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        let _ = countOfMediaView.pickerView(UIPickerView(), numberOfRowsInComponent: 0)
        
        //then
        XCTAssertTrue(presenterMock.updateNumberOfRowsCalled)
    }
    
    func testWhenTitleForRowThenPresenterUpdateTitleForRowCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        let _ = countOfMediaView.pickerView(UIPickerView(), titleForRow: 0, forComponent: 0)
        
        //then
        XCTAssertTrue(presenterMock.updateTitleForRowCalled)
    }
    
    func testWhenDidSelectRowThenPresenterDidSelectCountOfMediaCalled() {
        //given
        let presenterMock = CountOfMediaPresenterMock()
        countOfMediaView.presenter = presenterMock
        
        //when
        countOfMediaView.pickerView(UIPickerView(), didSelectRow: 0, inComponent: 0)
        
        //then
        XCTAssertTrue(presenterMock.didSelectCountOfMediaCalled)
    }
    
}

fileprivate class CountOfMediaPresenterMock: CountOfMediaViewOutput {
    
    var viewIsReadyCalled = false
    var onViewWillAppearCalled = false
    var updateNumberOfComponentsCalled = false
    var updateNumberOfRowsCalled = false
    var updateTitleForRowCalled = false
    var didSelectCountOfMediaCalled = false
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func onViewWillAppear() {
        onViewWillAppearCalled = true
    }
    
    func updateNumberOfComponents() {
        updateNumberOfComponentsCalled = true
    }
    
    func updateTitleForRow(for index: Int) {
        updateTitleForRowCalled = true
    }
    
    func didSelectCountOfMedia(at index: Int) {
        didSelectCountOfMediaCalled = true
    }
    
    func updateNumberOfRows() {
        updateNumberOfRowsCalled = true
    }
    
}
