//
//  SettingsUserDefaultsImpl.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SettingsUserDefaultsManagerImpl: SettingsUserDefaultsManager {
    
    let mediaTypeKey = "mediaType"
    let countKey = "count"
    let deviceTypeKey = "deviceType"
    
    var userDefaults = UserDefaults.standard
    
    func save(mediaType: MediaTypes) {
        userDefaults.set(mediaType.rawValue, forKey: mediaTypeKey)
    }
    
    func getMediaType() -> MediaTypes? {
        guard let mediaTypeValue = userDefaults.string(forKey: mediaTypeKey) else { return nil }
        return MediaTypes(rawValue: mediaTypeValue)
    }
    
    func save(countOfResults: Int) {
        userDefaults.set(countOfResults, forKey: countKey)
    }
    
    func getCountOfResults() -> Int {
        return userDefaults.integer(forKey: countKey)
    }
    
    func save(deviceType: DeviceTypes) {
        userDefaults.set(deviceType.rawValue, forKey: deviceTypeKey)
    }
    
    func getDeviceType() -> DeviceTypes? {
        guard let deviceTypeValue = userDefaults.string(forKey: deviceTypeKey) else { return nil }
        return DeviceTypes(rawValue: deviceTypeValue)
    }
    
}
