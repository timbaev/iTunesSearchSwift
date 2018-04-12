//
//  MediaApiProviderTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
import Alamofire
@testable import ItunesSearchTests

class MediaApiProviderTests: XCTestCase {
    
    var mediaApiProvider: MediaApiProvider!
    
    override func setUp() {
        super.setUp()
        mediaApiProvider = MediaApiProvider()
    }
    
    override func tearDown() {
        mediaApiProvider = nil
        super.tearDown()
    }
    
    func testThatMakeRequestReturnSuccessData() {
        //given
        let mediaSearchRequest = MediaSearchRequest(entity: "movie", limit: 1, term: "Movie", country: "US")
        let makeRequestExpectation = expectation(description: "Make request")
        
        //when
        mediaApiProvider.make(mediaSearchRequest) { (data) in
            XCTAssertNotNil(data)
            makeRequestExpectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 5) { (error) in
            guard let error = error else { return }
            XCTFail("Error after timeout: \(error)")
        }
    }
    
    func testThatMakeRequestReturnFailureWithNilIfResponseCode400() {
        //given
        let mediaSearchRequest = MediaSearchRequest(entity: "bla-bla", limit: 999999, term: "None", country: "ZZZ")
        let makeRequestExpectation = expectation(description: "Make request")
        
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [MockingUrlProtocol.self]
            return configuration
        }()
        mediaApiProvider.sessionManager = SessionManager(configuration: configuration)
        
        //when
        mediaApiProvider.make(mediaSearchRequest) { (data) in
            XCTAssertNil(data)
            makeRequestExpectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 5) { (error) in
            guard let error = error else { return }
            XCTFail("Error after timeout: \(error)")
        }
    }
    
}

fileprivate class MockingUrlProtocol: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        return URLProtocol.property(forKey: "HandledByProxyURLProtocol", in: request) == nil
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        guard let headers = request.allHTTPHeaderFields else { return request }
        do {
            return try URLEncoding.default.encode(request, with: headers)
        } catch {
            return request
        }
    }
    
    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }
    
    override func startLoading() {
        if let url = request.url,
            let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "HTTP/1.1", headerFields: nil) {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: URLCache.StoragePolicy.notAllowed)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
    }
    
}
