//
//  SearchMediaDatasourceTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SearchMediaDatasourceTests: XCTestCase {
    
    var searchMediaDatasource: SearchMediaDatasource!
    
    override func setUp() {
        super.setUp()
        searchMediaDatasource = SearchMediaDatasource()
    }
    
    override func tearDown() {
        searchMediaDatasource = nil
        super.tearDown()
    }
    
    func testThatSetCellModelsSetupCellModels() {
        //given
        let media = Media(
            name: "Name",
            author: "Author",
            description: nil,
            price: nil,
            imageURL: URL(fileURLWithPath: ""),
            viewURL: URL(fileURLWithPath: "")
        )
        let searchMediaCellModel = SearchMediaCellModelImpl(media: media)
        
        //when
        searchMediaDatasource.set(cellModels: [searchMediaCellModel])
        
        //then
        XCTAssertEqual(searchMediaCellModel, searchMediaDatasource.cellModels.first as! SearchMediaCellModelImpl)
    }
    
    func testThatClearDeleteAllDataFromCellModelsArray() {
        //given
        let media = Media(
            name: "Name",
            author: "Author",
            description: nil,
            price: nil,
            imageURL: URL(fileURLWithPath: ""),
            viewURL: URL(fileURLWithPath: "")
        )
        let searchMediaCellModel = SearchMediaCellModelImpl(media: media)
        searchMediaDatasource.cellModels = [searchMediaCellModel]
        
        //when
        searchMediaDatasource.clear()
        
        //then
        XCTAssertTrue(searchMediaDatasource.cellModels.isEmpty)
    }
    
    func testThatSetImageSetupImageToCell() {
        //given
        let imageView = UIImageView()
        let image = UIImage()
        let cell = SearchMediaTableViewCell()
        cell.mediaImageView = imageView
        
        //when
        searchMediaDatasource.set(image: image, to: cell)
        
        //then
        XCTAssertNotNil(imageView.image)
    }
    
    func testThatNumberOfRowsInSectionReturnCellModelsArrayCount() {
        //given
        let media = Media(
            name: "Name",
            author: "Author",
            description: nil,
            price: nil,
            imageURL: URL(fileURLWithPath: ""),
            viewURL: URL(fileURLWithPath: "")
        )
        let searchMediaCellModel = SearchMediaCellModelImpl(media: media)
        searchMediaDatasource.cellModels = [searchMediaCellModel]
        
        let exptectedCount = searchMediaDatasource.cellModels.count
        
        //when
        let count = searchMediaDatasource.tableView(UITableView(), numberOfRowsInSection: 0)
        
        //then
        XCTAssertEqual(exptectedCount, count)
    }
    
    func testWhenCellForRowAtThenDownloadImageCalled() {
        //given
        let tableView = UITableView()
        let nib = UINib(nibName: "SearchMediaTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: .searchMedia)
        let media = Media(
            name: "Name",
            author: "Author",
            description: nil,
            price: nil,
            imageURL: URL(fileURLWithPath: ""),
            viewURL: URL(fileURLWithPath: "")
        )
        let searchMediaCellModel = SearchMediaCellModelImpl(media: media)
        searchMediaDatasource.cellModels = [searchMediaCellModel]
        
        let downloadImageMock = DownloadImageDelegateMock()
        searchMediaDatasource.downloadImageDelegate = downloadImageMock
        
        //when
        let _ = searchMediaDatasource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(downloadImageMock.downloadImageCalled)
    }
    
    func testWhenDidSelectRowThenShowPreviewCalled() {
        //given
        let media = Media(
            name: "Name",
            author: "Author",
            description: nil,
            price: nil,
            imageURL: URL(fileURLWithPath: ""),
            viewURL: URL(fileURLWithPath: "")
        )
        let searchMediaCellModel = SearchMediaCellModelImpl(media: media)
        searchMediaDatasource.cellModels = [searchMediaCellModel]
        
        let onCellSelectDelegateMock = OnCellSelectDelegateMock()
        searchMediaDatasource.selectDelegate = onCellSelectDelegateMock
        
        //when
        searchMediaDatasource.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(onCellSelectDelegateMock.showPreviewCalled)
    }

}

fileprivate class DownloadImageDelegateMock: DownloadImageDelegate {
    
    var downloadImageCalled = false
    
    func downloadImage(from url: URL, at indexPath: IndexPath) {
        downloadImageCalled = true
    }
    
}

fileprivate class OnCellSelectDelegateMock: OnCellSelectDelegate {
    
    var showPreviewCalled = false
    
    func showPreview(with url: URL) {
        showPreviewCalled = true
    }
    
}
