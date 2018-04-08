//
//  SettingsInteractorOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SettingsInteractorOutput: class {
    
    /// Saved user's media type
    ///
    /// - Parameter mediaType: media type
    func didGetSavedMediaType(_ mediaType: MediaTypes)
    
    /// Saved user's count of results
    ///
    /// - Parameter count: count of media results
    func didGettingSavedCountOfResults(_ count: Int)
    
    /// Saved user's device type
    ///
    /// - Parameter deviceType: device type
    func didGetSavedDeviceType(_ deviceType: DeviceTypes)
    
}
