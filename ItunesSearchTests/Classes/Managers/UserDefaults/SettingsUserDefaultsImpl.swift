//
//  SettingsUserDefaultsImpl.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SettingsUserDefaultsManagerImpl: SettingsUserDefaultsManager {
    
    private let mediaTypeKey = "mediaType"
    private let countKey = "count"
    
    func save(mediaType: MediaTypes) {
        UserDefaults.standard.set(mediaType.rawValue, forKey: mediaTypeKey)
    }
    
    func getMediaType() -> MediaTypes? {
        guard let mediaTypeValue = UserDefaults.standard.string(forKey: mediaTypeKey) else { return nil }
        return MediaTypes(rawValue: mediaTypeValue)
    }
    
    func save(countOfResults: Int) {
        UserDefaults.standard.set(countOfResults, forKey: countKey)
    }
    
    func getCountOfResults() -> Int {
        return UserDefaults.standard.integer(forKey: countKey)
    }
    
}
