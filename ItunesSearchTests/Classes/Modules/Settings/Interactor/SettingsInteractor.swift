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
    
    private let emptyCountOfResults = 0
    private let defaultCountOfResults = 1
    
    func prepareSettingsScrren() {
        guard let mediaType = settingsUserDefaultsManager.getMediaType() else { return }
        presenter.didGetSavedMediaType(mediaType)
        
        let countOfResults = settingsUserDefaultsManager.getCountOfResults()
        if (countOfResults == emptyCountOfResults) {
            presenter.didGettingSavedCountOfResults(defaultCountOfResults)
        } else {
            presenter.didGettingSavedCountOfResults(countOfResults)
        }
    }
    
}
