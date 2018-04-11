//
//  SettingsInteractorInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SettingsInteractorInput: class {
    
    /// Get saved user's media type
    func getSavedMediaType()
    
    /// Get saved user's count of result
    func getSavedCountOfResults()
    
    /// Get saved user's device type
    func getSavedDeviceType()
    
}
