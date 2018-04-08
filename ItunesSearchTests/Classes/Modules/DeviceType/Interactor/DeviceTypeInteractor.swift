//
//  DeviceTypeInteractor.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DeviceTypeInteractor: DeviceTypeInteractorInput {
    
    weak var presenter: DeviceTypeInteractorOutput!
    var settingsUserDefaultsManager: SettingsUserDefaultsManager!
    
    var deviceTypes: [DeviceTypes]!
    var defaultCheckmarkPosition = 0
    
    func prepareData() {
        self.deviceTypes = DeviceTypes.allValues
    }
    
    func prepareCheckmark() {
        guard let savedDeviceType = settingsUserDefaultsManager.getDeviceType(),
            let index = deviceTypes.index(where: { $0 == savedDeviceType }) else {
                presenter.didUpdateCheckmark(at: defaultCheckmarkPosition)
                return
        }
        presenter.didUpdateCheckmark(at: index)
    }
    
    func updateNumberOfRows() {
        let count = deviceTypes.count
        presenter.didUpdateNumberOfRows(count)
    }
    
    func updateTitle(at index: Int) {
        let title = deviceTypes[index].rawValue
        presenter.didUpdateTitle(title)
    }
    
    func saveDeviceTypeSetting(with index: Int) {
        let deviceType = deviceTypes[index]
        settingsUserDefaultsManager.save(deviceType: deviceType)
    }
    
}
