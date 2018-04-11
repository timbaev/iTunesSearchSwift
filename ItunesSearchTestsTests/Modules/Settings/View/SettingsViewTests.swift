//
//  SettingsViewTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 10.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SettingsViewTests: XCTestCase {
    
    var settingsViewController: SettingsViewController!
    
    override func setUp() {
        super.setUp()
        settingsViewController = SettingsViewController()
    }
    
    override func tearDown() {
        settingsViewController = nil
        super.tearDown()
    }
    
    func testCallViewIsReady() {
        //given
        let presenterMock = SettingsPresenterMock()
        settingsViewController.presenter = presenterMock
        
        //when
        settingsViewController.viewDidLoad()
        
        //then
        XCTAssertTrue(presenterMock.viewIsReadyCalled)
    }
    
    func testCallViewWillAppear() {
        //given
        let presenterMock = SettingsPresenterMock()
        settingsViewController.presenter = presenterMock
        
        //when
        settingsViewController.viewWillAppear(false)
        
        //then
        XCTAssertTrue(presenterMock.viewWillAppearCalled)
    }
    
    func testThatAfterViewDidLoadPrepareTableViewCalled() {
        //given
        let presenterMock = SettingsPresenterMock()
        settingsViewController.presenter = presenterMock
        let indexPath = IndexPath(row: 0, section: 0)
        
        //when
        settingsViewController.tableView(settingsViewController.tableView, didSelectRowAt: indexPath)
        
        //then
        XCTAssertTrue(presenterMock.selectSettingRowCalled)
    }
    
}

fileprivate class SettingsPresenterMock: SettingsViewOutput {
    
    var viewIsReadyCalled = false
    var viewWillAppearCalled = false
    var selectSettingRowCalled = false
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func onViewWillAppear() {
        viewWillAppearCalled = true
    }
    
    func didSelectSettingRow(at indexPath: IndexPath) {
        selectSettingRowCalled = true
    }
    
    
}
