//
//  SearchMediaRouter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit
import SafariServices

class SearchMediaRouter: SearchMediaRouterInput {
    
    weak var viewController: UIViewController!
    var commonAlertsFactory: CommonAlertsFactory!
    
    func showErrorAlert(with message: String) {
        let alert = commonAlertsFactory.getErrorAlert(with: message)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func showWebPage(with url: URL) {
        let svc = SFSafariViewController(url: url)
        viewController.present(svc, animated: true, completion: nil)
    }
    
}
