//
//  DeviceTypeViewOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DeviceTypeViewOutput: class {
    
    /// ViewDidLoad trigger
    func viewIsReady()
    
    /// Update count of rows
    func updateNumberOfRows()
    
    /// Update title for cell
    ///
    /// - Parameter indexPath: index of cell
    func updateTitle(at indexPath: IndexPath)
    
    /// ViewDidAppear trigger
    func onViewDidAppear()
    
    /// Select device type
    ///
    /// - Parameter indexPath: index of selected cell
    func didSelectDeviceType(at indexPath: IndexPath)
    
}
