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
    
}
