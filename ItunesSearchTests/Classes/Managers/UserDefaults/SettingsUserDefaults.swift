//
//  SettingsUserDefaults.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SettingsUserDefaultsManager {
    
    /// Save picked media type
    ///
    /// - Parameter mediaType: media type
    func save(mediaType: MediaTypes)
    
    /// Get saved media type
    ///
    /// - Returns: media type
    func getMediaType() -> MediaTypes?
    
    /// Save count of results
    ///
    /// - Parameter count: count value
    func save(countOfResults: Int)
    
    /// Get saved count of resuls
    ///
    /// - Returns: count of results value
    func getCountOfResults() -> Int
    
    /// Save picked device type
    ///
    /// - Parameter deviceType: device type
    func save(deviceType: DeviceTypes)
    
    /// Get saved device type
    ///
    /// - Returns: device type
    func getDeviceType() -> DeviceTypes?
    
}
