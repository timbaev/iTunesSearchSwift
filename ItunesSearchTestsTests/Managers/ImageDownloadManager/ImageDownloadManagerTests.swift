//
//  ImageDownloadManagerTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class ImageDownloadManagerTests: XCTestCase {
    
    var imageDownloadManager: ImageDownloadManagerImpl!
    
    override func setUp() {
        super.setUp()
        imageDownloadManager = ImageDownloadManagerImpl()
    }
    
    override func tearDown() {
        imageDownloadManager = nil
        super.tearDown()
    }
    
    func testThatDownloadImageReturnSuccessWithImage() {
        //given
        let expectationImageDownload = expectation(description: "Image download with image result")
        let imageURL = URL(string: "https://bit.ly/2qrBbkK")!
        
        //when
        imageDownloadManager.downloadImage(from: imageURL, success: { (image) in
            XCTAssertNotNil(image)
            
            expectationImageDownload.fulfill()
        }) { (errorMessage) in
            XCTFail(errorMessage)
        }
        
        //then
        waitForExpectations(timeout: 5) { (error) in
            guard let error = error else { return }
            XCTFail("wait for expectations with timeout errored: \(error)")
        }
    }
    
    func testThatDownloadImageReturnErrorWithMessage() {
        //given
        let expectationImageDownload = expectation(description: "Image download with image result")
        let imageURL = URL(string: "https://bit.ly/2qrBbkq")!
        
        //when
        imageDownloadManager.downloadImage(from: imageURL, success: { (image) in
            XCTAssertNil(image)
            XCTFail("Hmm..test should be failed")
        }) { (errorMessage) in
            expectationImageDownload.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 5) { (error) in
            guard let error = error else { return }
            XCTFail("wait for expectations with timeout errored: \(error)")
        }
    }
    
    func testCacheSaveImage() {
        //given
        let imageKey = "key"
        imageDownloadManager.saveToCache(image: UIImage(), for: imageKey)
        
        let cacheExpectation = expectation(description: "Cache image")
        
        //when
        imageDownloadManager.getFromCache(for: imageKey) { (image) in
            XCTAssertNotNil(image)
            cacheExpectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 2) { (error) in
            guard let error = error else { return }
            XCTFail("wait for expectations with timeout errored: \(error)")
        }
    }
    
}


