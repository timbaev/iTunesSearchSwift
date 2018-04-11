//
//  SearchMediaPresenterTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SearchMediaPresenterTests: XCTestCase {
    
    var searchMediaPresenter: SearchMediaPresenter!
    
    override func setUp() {
        super.setUp()
        searchMediaPresenter = SearchMediaPresenter()
    }
    
    override func tearDown() {
        searchMediaPresenter = nil
        super.tearDown()
    }
    
    func testWhenViewIsReadyThenViewPrepareMethodsCalled() {
        //given
        let viewMock = SearchMediaViewMock()
        searchMediaPresenter.view = viewMock
        
        //when
        searchMediaPresenter.viewIsReady()
        
        //then
        XCTAssertTrue(viewMock.prepareTableViewCalled)
        XCTAssertTrue(viewMock.prepareSearchControllerCalled)
        XCTAssertTrue(viewMock.prepareDatasourceCalled)
    }
    
    func testWhenDidUpdateSearchTextThenViewClearAllDataAndReloadTableViewCalledIfTextEmpty() {
        //given
        let viewMock = SearchMediaViewMock()
        let interactorMock = SearchMediaInteractorMock()
        searchMediaPresenter.view = viewMock
        searchMediaPresenter.interactor = interactorMock
        
        //when
        searchMediaPresenter.didUpdateSearchText("")
        
        //then
        XCTAssertTrue(viewMock.prepareTableViewCalled)
        XCTAssertTrue(viewMock.clearAllDataCalled)
        XCTAssertFalse(interactorMock.searchMediaCalled)
    }
    
    func testWhenDidUpdateSearchTextThenInteractorSearchMediaCalledIfTextNotEmpty() {
        //given
        let viewMock = SearchMediaViewMock()
        let interactorMock = SearchMediaInteractorMock()
        searchMediaPresenter.view = viewMock
        searchMediaPresenter.interactor = interactorMock
        
        //when
        searchMediaPresenter.didUpdateSearchText("Deadline is coming...")
        
        //then
        XCTAssertFalse(viewMock.prepareTableViewCalled)
        XCTAssertFalse(viewMock.clearAllDataCalled)
        XCTAssertTrue(interactorMock.searchMediaCalled)
    }
    
    func testWhenDidLoadSearchMediaResultWithSuccessThenViewSetCellModelsAndReloadTableViewCalled() {
        //given
        let viewMock = SearchMediaViewMock()
        let routerMock = SearchMediaRouterMock()
        searchMediaPresenter.view = viewMock
        searchMediaPresenter.router = routerMock
        
        //when
        let media = Media(
            name: "Name",
            author: "Author",
            description: nil,
            price: nil,
            imageURL: URL(string: "google.com")!,
            viewURL: URL(string: "google.com")!
        )
        searchMediaPresenter.didLoadSearchMediaResult(with: .success([media]))
        
        //then
        XCTAssertTrue(viewMock.setCellModelsCalled)
        XCTAssertTrue(viewMock.reloadTableViewCalled)
        XCTAssertFalse(routerMock.showErrorAlertCalled)
    }
    
    func testWhenDidLoadSearchMediaResultWithFailureThenRouterShowErrorAlertCalled() {
        //given
        let viewMock = SearchMediaViewMock()
        let routerMock = SearchMediaRouterMock()
        searchMediaPresenter.view = viewMock
        searchMediaPresenter.router = routerMock
        
        //when
        searchMediaPresenter.didLoadSearchMediaResult(with: .failure("Oups!"))
        
        //then
        XCTAssertTrue(routerMock.showErrorAlertCalled)
        XCTAssertFalse(viewMock.setCellModelsCalled)
        XCTAssertFalse(viewMock.reloadTableViewCalled)
    }
    
    func testWhenDidLoadImageWithSuccessThenViewSetImageCalled() {
        //given
        let viewMock = SearchMediaViewMock()
        let routerMock = SearchMediaRouterMock()
        searchMediaPresenter.view = viewMock
        searchMediaPresenter.router = routerMock
        
        //when
        let imageModel = ImageModel(image: UIImage())
        searchMediaPresenter.didLoadImage(with: .success(imageModel), at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(viewMock.setImageCalled)
        XCTAssertFalse(routerMock.showErrorAlertCalled)
    }
    
    func testWhenDidLoadImageWithFailureThenRouterShowErrorAlertCalled() {
        //given
        let viewMock = SearchMediaViewMock()
        let routerMock = SearchMediaRouterMock()
        searchMediaPresenter.view = viewMock
        searchMediaPresenter.router = routerMock
        
        //when
        searchMediaPresenter.didLoadImage(with: .failure("Error"), at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(routerMock.showErrorAlertCalled)
        XCTAssertFalse(viewMock.setImageCalled)
    }
    
    func testWhenDownloadImageThenInteractorDownloadImageCalled() {
        //given
        let interactorMock = SearchMediaInteractorMock()
        searchMediaPresenter.interactor = interactorMock
        
        //when
        searchMediaPresenter.downloadImage(from: URL(string: "google.com")!, at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(interactorMock.downloadImageCalled)
    }
    
    func testWhenShowPreviewThenRouterShowWebPageCalled() {
        //given
        let routerMock = SearchMediaRouterMock()
        searchMediaPresenter.router = routerMock
        
        //when
        searchMediaPresenter.showPreview(with: URL(string: "google.com")!)
        
        //then
        XCTAssertTrue(routerMock.showWebPageCalled)
    }
    
}

fileprivate class SearchMediaViewMock: SearchMediaViewInput {
    
    var prepareTableViewCalled = false
    var prepareSearchControllerCalled = false
    var prepareDatasourceCalled = false
    var clearAllDataCalled = false
    var reloadTableViewCalled = false
    var setCellModelsCalled = false
    var setImageCalled = false
    
    func set(cellModels models: [SearchMediaCellModel]) {
        setCellModelsCalled = true
    }
    
    func set(image: UIImage, at indexPath: IndexPath) {
        setImageCalled = true
    }
    
    func prepareTableView() {
        prepareTableViewCalled = true
    }
    
    func reloadTableView() {
        reloadTableViewCalled = true
    }
    
    func clearAllData() {
        clearAllDataCalled = true
    }
    
    func prepareSearchController() {
        prepareSearchControllerCalled = true
    }
    
    func prepareDatasource() {
        prepareDatasourceCalled = true
    }
    
}

fileprivate class SearchMediaInteractorMock: SearchMediaInteractorInput {
    
    var searchMediaCalled = false
    var downloadImageCalled = false
    
    func searchMedia(with text: String) {
        searchMediaCalled = true
    }
    
    func downloadImage(from url: URL, at indexPath: IndexPath) {
        downloadImageCalled = true
    }
    
}

fileprivate class SearchMediaRouterMock: SearchMediaRouterInput {
    
    var showErrorAlertCalled = false
    var showWebPageCalled = false
    
    func showErrorAlert(with message: String) {
        showErrorAlertCalled = true
    }
    
    func showWebPage(with url: URL) {
        showWebPageCalled = true
    }
    
}
