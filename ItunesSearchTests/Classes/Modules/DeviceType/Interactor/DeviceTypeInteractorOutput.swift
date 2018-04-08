//
//  DeviceTypeInteractorOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DeviceTypeInteractorOutput: class {
    
    /// Number of rows result
    ///
    /// - Parameter count: count of rows
    func didUpdateNumberOfRows(_ count: Int)
    
    /// Getting title result
    ///
    /// - Parameter title: title for update
    func didUpdateTitle(_ title: String)
    
    /// Update checkmark for cell
    ///
    /// - Parameter index: index of cell
    func didUpdateCheckmark(at index: Int)
    
}
