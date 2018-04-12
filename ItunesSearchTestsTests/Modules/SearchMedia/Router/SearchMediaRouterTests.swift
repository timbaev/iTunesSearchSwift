//
//  SearchMediaRouterTests.swift
//  ItunesSearchTestsTests
//
//  Created by Тимур Шафигуллин on 12.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest
import SafariServices
@testable import ItunesSearchTests

class SearchMediaRouterTests: XCTestCase {
    
    var searchMediaRouter: SearchMediaRouter!
    
    override func setUp() {
        super.setUp()
        searchMediaRouter = SearchMediaRouter()
    }
    
    override func tearDown() {
        searchMediaRouter = nil
        super.tearDown()
    }
    
    func testWhenShowErrorAlertThenAlertFactoryGetErrorAlertCalledAndViewControllerShowed() {
        //given
        let alertsFactoryMock = CommonAlertsFactoryMock()
        let searchViewController: SearchMediaViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        UIApplication.shared.keyWindow?.rootViewController = searchViewController
        searchMediaRouter.viewController = searchViewController
        searchMediaRouter.commonAlertsFactory = alertsFactoryMock
        
        //when
        searchMediaRouter.showErrorAlert(with: "Error message")
        
        //then
        XCTAssertTrue(alertsFactoryMock.getErroAlertCalled)
        XCTAssertNotNil(searchViewController.presentedViewController)
        XCTAssertTrue(searchViewController.presentedViewController is UIAlertController)
    }
    
    func testThatShowWebPagePresentSFSafariViewController() {
        //given
        let searchViewController: SearchMediaViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        UIApplication.shared.keyWindow?.rootViewController = searchViewController
        searchMediaRouter.viewController = searchViewController
        
        //when
        searchMediaRouter.showWebPage(with: URL(string: "https://www.google.ru")!)
        
        //then
        XCTAssertNotNil(searchViewController.presentedViewController)
        XCTAssertTrue(searchViewController.presentedViewController is SFSafariViewController)
    }
    
}

fileprivate class CommonAlertsFactoryMock: CommonAlertsFactory {
    
    var getErroAlertCalled = false
    
    func getErrorAlert(with message: String) -> UIViewController {
        getErroAlertCalled = true
        return UIAlertController(title: "Title", message: nil, preferredStyle: .alert)
    }
    
}
