//
//  SearchMediaRouterInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SearchMediaRouterInput: class {
    
    /// Show error alert
    ///
    /// - Parameter message: message to display
    func showErrorAlert(with message: String)
    
}
