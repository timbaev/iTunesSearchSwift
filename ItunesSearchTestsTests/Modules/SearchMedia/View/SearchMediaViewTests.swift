//
//  SearchMediaViewTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SearchMediaViewTests: XCTestCase {
    
    var searchMediaViewController: SearchMediaViewController!
    
    override func setUp() {
        super.setUp()
        searchMediaViewController = SearchMediaViewController()
    }
    
    override func tearDown() {
        searchMediaViewController = nil
        super.tearDown()
    }
    
    func testWhenViewDidLoadThenPresenterViewIsReadyCalled() {
        //given
        let presenterMock = SearchMediaPresenterMock()
        searchMediaViewController.presenter = presenterMock
        
        //when
        searchMediaViewController.viewDidLoad()
        
        //then
        XCTAssertTrue(presenterMock.viewIsReadyCalled)
    }
    
    func testThatPrepareTableViewSetupDelegateDatasourceAndRegisterCell() {
        //given
        let tableView = UITableView()
        let datasourceMock = SearchMediaDatasourceMock()
        searchMediaViewController.tableView = tableView
        searchMediaViewController.searchMediaDatasource = datasourceMock
        
        //when
        searchMediaViewController.prepareTableView()
        
        //then
        XCTAssertNotNil(tableView.dequeueReusableCell(withIdentifier: .searchMedia, for: IndexPath(row: 0, section: 0)))
        XCTAssertNotNil(tableView.delegate)
        XCTAssertNotNil(tableView.dataSource)
        XCTAssertTrue(tableView.delegate is SearchMediaDatasourceInput)
        XCTAssertTrue(tableView.dataSource is SearchMediaDatasourceInput)
    }
    
    func testThatPrepareSearchControllerSetupAttributes() {
        //given
        let expectedObscuresBackgroundDuringPresentation = false
        let expectedDefinesPresentationContext = true
        
        //when
        searchMediaViewController.prepareSearchController()
        
        //then
        XCTAssertNotNil(searchMediaViewController.searchController.searchResultsUpdater)
        XCTAssertTrue(searchMediaViewController.searchController.searchResultsUpdater is SearchMediaViewController)
        
        XCTAssertEqual(
            expectedObscuresBackgroundDuringPresentation,
            searchMediaViewController.searchController.obscuresBackgroundDuringPresentation)
        
        XCTAssertNotNil(searchMediaViewController.navigationItem.searchController)
        XCTAssertEqual(
            searchMediaViewController.navigationItem.searchController,
            searchMediaViewController.searchController)
        
        XCTAssertEqual(expectedDefinesPresentationContext, searchMediaViewController.definesPresentationContext)
    }
    
    func testWhenSetCellModelsThenDatasourceSetCellModelsCalled() {
        //given
        let datasourceMock = SearchMediaDatasourceMock()
        searchMediaViewController.searchMediaDatasource = datasourceMock
        
        //when
        let searchCellModel = SearchMediaCellModelImpl(media:
            Media(
                name: "Name",
                author: "Author",
                description: nil,
                price: nil,
                imageURL: URL(string: "google.com")!,
                viewURL: URL(string: "google.com")!)
        )
        searchMediaViewController.set(cellModels: [searchCellModel])
        
        //then
        XCTAssertTrue(datasourceMock.setCellModelsCalled)
    }
    
    func testThatReloadTableViewCallTableViewReloadData() {
        //given
        let datasourceMock = SearchMediaDatasourceMock()
        let tableView = UITableView()
        searchMediaViewController.searchMediaDatasource = datasourceMock
        searchMediaViewController.tableView = tableView
        
        tableView.delegate = datasourceMock
        tableView.dataSource = datasourceMock
        
        //when
        searchMediaViewController.reloadTableView()
        
        //then
        XCTAssertTrue(datasourceMock.numberOfRowsInSectionCalled)
    }
    
    func testWhenClearAllDataThenDatasourceClearCalled() {
        //given
        let datasourceMock = SearchMediaDatasourceMock()
        searchMediaViewController.searchMediaDatasource = datasourceMock
        
        //when
        searchMediaViewController.clearAllData()
        
        //then
        XCTAssertTrue(datasourceMock.clearCalled)
    }
    
    func testThatPrepareDatasourceSetupDelegates() {
        //given
        let datasourceMock = SearchMediaDatasourceMock()
        let presenterMock = SearchMediaPresenterMock()
        searchMediaViewController.searchMediaDatasource = datasourceMock
        searchMediaViewController.presenter = presenterMock
        
        //when
        searchMediaViewController.prepareDatasource()
        
        //then
        XCTAssertNotNil(datasourceMock.downloadImageDelegate)
        XCTAssertNotNil(datasourceMock.selectDelegate)
    }
    
    func testWhenSetImageThenDatasourceSetImageCalled() {
        //given
        let datasourceMock = SearchMediaDatasourceMock()
        let tableView = UITableView()
        searchMediaViewController.searchMediaDatasource = datasourceMock
        searchMediaViewController.tableView = tableView
        
        tableView.delegate = datasourceMock
        tableView.dataSource = datasourceMock
        tableView.reloadData()
        
        //when
        searchMediaViewController.set(image: UIImage(), at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(datasourceMock.setImageCalled)
    }
    
    func testWhenUpdateSearchResultsThenPresneterDidUpdateSearchTextCalled() {
        //given
        let presenterMock = SearchMediaPresenterMock()
        searchMediaViewController.presenter = presenterMock
        
        searchMediaViewController.searchController.searchBar.text = "Hello, again!"
        
        //when
        searchMediaViewController.updateSearchResults(for: searchMediaViewController.searchController)
        
        //then
        XCTAssertTrue(presenterMock.didUpdateSearchTextCalled)
    }
    
    
    
}

fileprivate class SearchMediaPresenterMock: SearchMediaViewOutput, DownloadImageDelegate, OnCellSelectDelegate {
    
    var viewIsReadyCalled = false
    var didUpdateSearchTextCalled = false
    
    func showPreview(with url: URL) {
        
    }
    
    func downloadImage(from url: URL, at indexPath: IndexPath) {
        
    }
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func didUpdateSearchText(_ text: String) {
        didUpdateSearchTextCalled = true
    }
    
}

fileprivate class SearchMediaDatasourceMock: NSObject, SearchMediaDatasourceInput {
    
    var selectDelegate: OnCellSelectDelegate?
    var downloadImageDelegate: DownloadImageDelegate?
    
    var setCellModelsCalled = false
    var numberOfRowsInSectionCalled = false
    var cellForRowAtCalled = false
    var clearCalled = false
    var setImageCalled = false
    
    func set(cellModels models: [SearchMediaCellModel]) {
        setCellModelsCalled = true
    }
    
    func set(image: UIImage, to cell: UITableViewCell) {
        setImageCalled = true
    }
    
    func clear() {
        clearCalled = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSectionCalled = true
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForRowAtCalled = true
        return UITableViewCell()
    }
    
}
