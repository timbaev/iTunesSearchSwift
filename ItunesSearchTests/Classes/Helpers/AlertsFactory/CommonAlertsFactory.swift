//
//  CommonAlertsFactoryProtocol.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol CommonAlertsFactory: class {
    
    /// Get UIAlertController with error title
    ///
    /// - Parameter message: error message to show
    /// - Returns: prepared alert
    func getErrorAlert(with message: String) -> UIViewController
    
}
