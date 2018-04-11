//
//  SearchMediaInteractorTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
@testable import ItunesSearchTests

class SearchMediaInteractorTests: XCTestCase {
    
    var searchMediaInteator: SearchMediaInteractor!
    
    override func setUp() {
        super.setUp()
        searchMediaInteator = SearchMediaInteractor()
    }
    
    override func tearDown() {
        searchMediaInteator = nil
        super.tearDown()
    }
    
    func testWhenSearchMediaThenMediaServiceSearchMediaCalled() {
        //given
        let settingsUserDefaultsManagerMock = SettingsUserDefaultsManagerMock()
        let mediaServiceMock = MediaServiceMock()
        searchMediaInteator.settingsUserDefaultsManager = settingsUserDefaultsManagerMock
        searchMediaInteator.mediaServie = mediaServiceMock
        
        //when
        searchMediaInteator.delayedSearchMedia(with: "Search string")
        
        //then
        XCTAssertTrue(mediaServiceMock.searchMediaCalled)
    }
    
    func testThatFilterReturnOnlyIphonApps() {
        //given
        let iPhoneDevices = ["iPhone5s-iPhones5s, iPhone6-iPhone6"]
        let iPadDevices = ["iPad2-iPad2, iPad3-iPad3"]
        let universalDevices = ["iPhone5s-iPhone5s, iPad2-iPad2"]
        
        let iPhoneApps = MediaParser.RawMediaReponse(
            trackName: "Track",
            artistName: "Artist",
            shortDescription: nil,
            trackPrice: nil,
            artworkUrl60: URL(fileURLWithPath: ""),
            trackViewUrl: URL(fileURLWithPath: ""),
            supportedDevices: iPhoneDevices
        )
        let iPadApps = MediaParser.RawMediaReponse(
            trackName: "Track",
            artistName: "Artist",
            shortDescription: nil,
            trackPrice: nil,
            artworkUrl60: URL(fileURLWithPath: ""),
            trackViewUrl: URL(fileURLWithPath: ""),
            supportedDevices: iPadDevices
        )
        let universalApps = MediaParser.RawMediaReponse(
            trackName: "Track",
            artistName: "Artist",
            shortDescription: nil,
            trackPrice: nil,
            artworkUrl60: URL(fileURLWithPath: ""),
            trackViewUrl: URL(fileURLWithPath: ""),
            supportedDevices: universalDevices
        )
        
        let expectedResult = iPhoneApps
        
        //when
        let sortResult = searchMediaInteator.filter([iPhoneApps, iPadApps, universalApps], deviceType: .iPhone)
        
        //then
        XCTAssertEqual([expectedResult], sortResult)
    }
    
    func testWhenDownloadImageThenImageDownloadManagerDownloadImageCalled() {
        //given
        let imageDownloadManagerMock = ImageDownloadManagerMock()
        searchMediaInteator.imageDownloadManager = imageDownloadManagerMock
        
        //when
        searchMediaInteator.downloadImage(from: URL(fileURLWithPath: ""), at: IndexPath(row: 0, section: 0))
        
        //then
        XCTAssertTrue(imageDownloadManagerMock.downloadImageCalled)
    }
    
}

fileprivate class SettingsUserDefaultsManagerMock: SettingsUserDefaultsManager {
    
    var savedMediaType: MediaTypes?
    var savedCountOfResults = 0
    var savedDeviceType: DeviceTypes?
    
    var saveDeviceTypeCalled = false
    
    func save(mediaType: MediaTypes) {
        savedMediaType = mediaType
    }
    
    func getMediaType() -> MediaTypes? {
        return savedMediaType
    }
    
    func save(countOfResults: Int) {
        savedCountOfResults = countOfResults
    }
    
    func getCountOfResults() -> Int {
        return savedCountOfResults
    }
    
    func save(deviceType: DeviceTypes) {
        savedDeviceType = deviceType
        saveDeviceTypeCalled = true
    }
    
    func getDeviceType() -> DeviceTypes? {
        return savedDeviceType
    }
    
}

fileprivate class MediaServiceMock: MediaService {
    
    var searchMediaCalled = false
    
    func searchMedia(with keyword: String, media: String, limit: Int, country: String, success: @escaping ([MediaParser.RawMediaReponse]) -> (), failure: @escaping (String) -> ()) {
        searchMediaCalled = true
    }
    
}

fileprivate class ImageDownloadManagerMock: ImageDownloadManager {
    
    var downloadImageCalled = false
    
    func downloadImage(from url: URL, success: @escaping (UIImage?) -> Void, failure: @escaping (String) -> Void) {
        downloadImageCalled = true
    }
    
}

