//
//  MediaServiceTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 13.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class MediaServiceTests: XCTestCase {
    
    var mediaService: MediaServiceImpl!
    
    override func setUp() {
        super.setUp()
        mediaService = MediaServiceImpl(apiProvider: ApiProvierMock())
    }
    
    override func tearDown() {
        mediaService = nil
        super.tearDown()
    }
    
    func testThatSearchMediaCorrectParsedData() {
        //given
        let expectedResponse = MediaParser.RawMediaReponse.init(
            trackName: "Name",
            artistName: "Artist",
            shortDescription: nil,
            trackPrice: nil,
            artworkUrl60: URL(string: "google.com")!,
            trackViewUrl: URL(string: "google.com")!,
            supportedDevices: nil
        )
        let mediaExpectation = expectation(description: "Media service search")
        
        //when
        mediaService.searchMedia(with: "Keyword", media: "media", limit: 1, country: "RU", success: { (response) in
            XCTAssertEqual([expectedResponse], response)
            mediaExpectation.fulfill()
        }) { (errorMessage) in
            XCTFail("Incorrect request")
        }
        
        //then
        waitForExpectations(timeout: 5) { (error) in
            guard let error = error else { return }
            XCTFail("Error after timeout: \(error)")
        }
    }
    
    func testThatSearchMediaReturnFailureIfDataNotParsed() {
        //given
        mediaService.apiProvider = FailableApiProviderMock()
        let expectedErrorMessage = mediaService.errorMessage
        let mediaExpectation = expectation(description: "Media service search")
        
        //when
        mediaService.searchMedia(with: "Keyword", media: "Media", limit: 1, country: "US", success: { (response) in
            XCTFail("This test should call failure completion block")
        }) { (errorMessage) in
            XCTAssertEqual(expectedErrorMessage, errorMessage)
            mediaExpectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 5) { (error) in
            guard let error = error else { return }
            XCTFail("Error after timeout: \(error)")
        }
    }
    
}

fileprivate class ApiProvierMock: ApiProvier {
    
    var baseURL = URL(fileURLWithPath: "")
    
    func make(_ request: Request, completionBlock: @escaping (Data?) -> ()) {
        let rawMediaResponse = MediaParser.RawMediaReponse.init(
            trackName: "Name",
            artistName: "Artist",
            shortDescription: nil,
            trackPrice: nil,
            artworkUrl60: URL(string: "google.com")!,
            trackViewUrl: URL(string: "google.com")!,
            supportedDevices: nil
        )
        let serverResponse = MediaParser(results: [rawMediaResponse])
        let data = try? JSONEncoder().encode(serverResponse)
        completionBlock(data)
    }
}

fileprivate class FailableApiProviderMock: ApiProvier {
    var baseURL = URL(fileURLWithPath: "")
    
    func make(_ request: Request, completionBlock: @escaping (Data?) -> ()) {
        completionBlock(Data())
    }

}
