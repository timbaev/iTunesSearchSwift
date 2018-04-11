//
//  MediaTypeViewTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class MediaTypeViewTests: XCTestCase {
    
    var mediaTypeViewController: MediaTypeViewController!
    
    override func setUp() {
        super.setUp()
        mediaTypeViewController = MediaTypeViewController()
    }
    
    override func tearDown() {
        mediaTypeViewController = nil
        super.tearDown()
    }
    
    func testWhenViewDidLoadThenViewIsReadyCalled() {
        //given
        let presenterMock = MediaTypePresneterMock()
        mediaTypeViewController.presenter = presenterMock
        
        //when
        mediaTypeViewController.viewDidLoad()
        
        //then
        XCTAssertTrue(presenterMock.viewIsReadyCalled)
    }
    
    func testWhenViewDidAppearThenOnViewDidAppearCalled() {
        //given
        let presenterMock = MediaTypePresneterMock()
        mediaTypeViewController.presenter = presenterMock
        
        //when
        mediaTypeViewController.viewDidAppear(false)
        
        //then
        XCTAssertTrue(presenterMock.onViewDidAppearCalled)
    }
    
    func testWhenNumberOfRowsInSectionThenGetCountOfMediaTypesCalled() {
        //given
        let presenterMock = MediaTypePresneterMock()
        mediaTypeViewController.presenter = presenterMock
        let tableView = UITableView()
        
        //when
        let _ = mediaTypeViewController.tableView(tableView, numberOfRowsInSection: 0)
        
        //then
        XCTAssertTrue(presenterMock.getCountOfMediaTypesCalled)
    }
    
    func testWhenCellForRowThenUpdateMediaTypeTitleCalled() {
        //given
        let presenterMock = MediaTypePresneterMock()
        mediaTypeViewController.presenter = presenterMock
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: mediaTypeViewController.cellIdentifier)
        
        //when
        let _ = mediaTypeViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(presenterMock.updateMediaTypeTitleCalled)
    }
    
    func testWhenDidSelectRowThenDidSelectMediaTypeCalled() {
        //given
        let presenterMock = MediaTypePresneterMock()
        mediaTypeViewController.presenter = presenterMock
        let tableView = UITableView()
        
        //when
        mediaTypeViewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(presenterMock.didSelectMediaTypeCalled)
    }
    
}

fileprivate class MediaTypePresneterMock: MediaTypeViewOutput {
    
    var viewIsReadyCalled = false
    var onViewDidAppearCalled = false
    var getCountOfMediaTypesCalled = false
    var updateMediaTypeTitleCalled = false
    var didSelectMediaTypeCalled = false
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func onViewDidAppear() {
        onViewDidAppearCalled = true
    }
    
    func getCountOfMediaTypes() {
        getCountOfMediaTypesCalled = true
    }
    
    func updateMediaTypeTitle(at indexPath: IndexPath) {
        if indexPath.row == 0, indexPath.section == 0 {
            updateMediaTypeTitleCalled = true
        }
    }
    
    func didSelectMediaType(at indexPath: IndexPath) {
        if indexPath.row == 0, indexPath.section == 0 {
            didSelectMediaTypeCalled = true
        }
    }
    
}
