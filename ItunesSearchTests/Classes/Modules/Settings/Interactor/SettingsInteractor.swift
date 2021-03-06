//
//  SettingsInteractor.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SettingsInteractor: SettingsInteractorInput {
    
    weak var presenter: SettingsInteractorOutput!
    var settingsUserDefaultsManager: SettingsUserDefaultsManager!
    
    var emptyCountOfResults = 0
    var defaultCountOfResults = 1
    
    func getSavedMediaType() {
        guard let mediaType = settingsUserDefaultsManager.getMediaType() else { return }
        presenter.didGetSavedMediaType(mediaType)
    }
    
    func getSavedCountOfResults() {
        let countOfResults = settingsUserDefaultsManager.getCountOfResults()
        if (countOfResults == emptyCountOfResults) {
            presenter.didGettingSavedCountOfResults(defaultCountOfResults)
        } else {
            presenter.didGettingSavedCountOfResults(countOfResults)
        }
    }
    
    func getSavedDeviceType() {
        guard let deviceType = settingsUserDefaultsManager.getDeviceType() else { return }
        presenter.didGetSavedDeviceType(deviceType)
    }
    
}
