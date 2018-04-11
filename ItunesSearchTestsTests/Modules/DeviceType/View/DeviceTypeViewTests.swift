//
//  DeviceTypeViewTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class DeviceTypeViewTests: XCTestCase {
    
    var deviceTypeViewController: DeviceTypeViewController!
    
    override func setUp() {
        super.setUp()
        deviceTypeViewController = DeviceTypeViewController()
    }
    
    override func tearDown() {
        deviceTypeViewController = nil
        super.tearDown()
    }
    
    func testWhenViewDidLoadThenPresenterViewIsReadyCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        
        //when
        deviceTypeViewController.viewDidLoad()
        
        //then
        XCTAssertTrue(presenterMock.viewIsReadyCalled)
    }
    
    func testWhenViewDidAppearThenPresenterOnViewDidAppearCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        
        //when
        deviceTypeViewController.viewDidAppear(false)
        
        //then
        XCTAssertTrue(presenterMock.onViewDidAppearCalled)
    }
    
    func testThatSetNumberOfRowsSetupCurrentNumberOfRows() {
        //given
        let expectedNumberOfRows = 5
        
        //when
        deviceTypeViewController.set(numberOfRows: expectedNumberOfRows)
        
        //then
        XCTAssertNotNil(deviceTypeViewController.currentNumberOfRows)
        XCTAssertEqual(expectedNumberOfRows, deviceTypeViewController.currentNumberOfRows)
    }
    
    func testThatSetTitleSetupCurrentTitle() {
        //given
        let expectedTitle = "Hello from Flatstack!"
        
        //when
        deviceTypeViewController.set(currentTitle: expectedTitle)
        
        //then
        XCTAssertNotNil(deviceTypeViewController.currentTitle)
        XCTAssertEqual(expectedTitle, deviceTypeViewController.currentTitle)
    }
    
    func testThatSetCheckedCellSetupAccessoryTypeToCheckmark() {
        //given
        let tableView = UITableView()
        
        let indexPathOfRow = IndexPath(row: 0, section: 0)
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        deviceTypeViewController.tableView = tableView
        
        deviceTypeViewController.currentNumberOfRows = 1
        tableView.delegate = deviceTypeViewController
        tableView.dataSource = deviceTypeViewController
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: deviceTypeViewController.cellIdentifier)
        tableView.reloadData()
        
        //when
        deviceTypeViewController.setCheckedCell(at: indexPathOfRow)
        
        //then
        let cell = tableView.cellForRow(at: indexPathOfRow)
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    func testThatSetUncheckedCellSetupAccessotyTypeToNone() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        
        let tableView = UITableView()
        deviceTypeViewController.tableView = tableView
        
        let indexPathOfRow = IndexPath(row: 0, section: 0)
        deviceTypeViewController.currentNumberOfRows = 1
        tableView.delegate = deviceTypeViewController
        tableView.dataSource = deviceTypeViewController
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: deviceTypeViewController.cellIdentifier)
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: indexPathOfRow)
        cell?.accessoryType = .checkmark
        
        //when
        deviceTypeViewController.setUncheckedCell(at: indexPathOfRow)
        
        //then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    func testWhenTableViewNumberOfSectionsThenPresenterUpdateNumberOfRowsCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        
        //when
        let _ = deviceTypeViewController.tableView(UITableView(), numberOfRowsInSection: 0)
        
        //then
        XCTAssertTrue(presenterMock.updateNumberOfRowsCalled)
    }
    
    func testWhenTableViewCellForRowAtThenPresenterUpdateTitleCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: deviceTypeViewController.cellIdentifier)
        
        //when
        let _ = deviceTypeViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(presenterMock.updateTitleCalled)
    }
    
    func testWhenTableViewDidSelectRowAtThenPresenterDidSelectDeviceTypeCalled() {
        //given
        let presenterMock = DeviceTypePresenterMock()
        deviceTypeViewController.presenter = presenterMock
        
        //when
        deviceTypeViewController.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(presenterMock.didSelectDeviceTypeCalled)
    }
    
}

fileprivate class DeviceTypePresenterMock: DeviceTypeViewOutput {
    
    var viewIsReadyCalled = false
    var onViewDidAppearCalled = false
    var updateNumberOfRowsCalled = false
    var updateTitleCalled = false
    var didSelectDeviceTypeCalled = false
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func updateNumberOfRows() {
        updateNumberOfRowsCalled = true
    }
    
    func updateTitle(at indexPath: IndexPath) {
        updateTitleCalled = true
    }
    
    func onViewDidAppear() {
        onViewDidAppearCalled = true
    }
    
    func didSelectDeviceType(at indexPath: IndexPath) {
        didSelectDeviceTypeCalled = true
    }
    
}
