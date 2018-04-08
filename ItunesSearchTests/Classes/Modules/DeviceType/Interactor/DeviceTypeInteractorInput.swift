//
//  DeviceTypeInteractorInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DeviceTypeInteractorInput: class {
    
    /// Prepare array with devices
    func prepareData()
    
    /// Update number of rows
    func updateNumberOfRows()
    
    /// Update title for cell
    ///
    /// - Parameter index: index of cell
    func updateTitle(at index: Int)
    
    /// Configure selected cell
    func prepareCheckmark()
    
    /// Save device type setting
    ///
    /// - Parameter index: index of device type in tableView
    func saveDeviceTypeSetting(with index: Int)
    
}
