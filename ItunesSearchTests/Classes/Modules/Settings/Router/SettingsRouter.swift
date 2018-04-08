//
//  SettingsRouter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class SettingsRouter: SettingsRouterInput {
    
    weak var viewController: UIViewController!
    private let showMediaTypesIdentifier = "showMediaTypes"
    private let showCountOfMediaIdentifier = "showCountOfMedia"
    private let showDeviceTypesIdentifier = "showDeviceTypes"
    
    func showMediaTypesScreen() {
        viewController.performSegue(withIdentifier: showMediaTypesIdentifier, sender: nil)
    }
    
    func showCountOfMediaScreen() {
        viewController.performSegue(withIdentifier: showCountOfMediaIdentifier, sender: nil)
    }
    
    func showDeviceTypeScreen() {
        viewController.performSegue(withIdentifier: showDeviceTypesIdentifier, sender: nil)
    }
    
}
