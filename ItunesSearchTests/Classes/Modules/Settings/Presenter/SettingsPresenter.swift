//
//  SettingsPresenter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SettingsPreseter: SettingsViewOutput, SettingsInteractorOutput {
    
    weak var view: SettingsViewInput!
    var interactor: SettingsInteractorInput!
    var router: SettingsRouterInput!
    
    private let mediaTypeIndex = 0
    private let countSettingIndex = 1
    
    //MARK: - View output
    
    func viewIsReady() {
        view.prepareTableView()
    }
    
    func onViewWillAppear() {
        interactor.prepareSettingsScrren()
    }
    
    func didSelectSettingRow(at indexPath: IndexPath) {
        let settingIndex = indexPath.row
        if (settingIndex == mediaTypeIndex) {
            router.showMediaTypesScreen()
        } else if (settingIndex == countSettingIndex) {
            router.showCountOfMediaScreen()
        }
    }
    
    func didGetSavedMediaType(_ mediaType: MediaTypes) {
        view.set(mediaTypeTitle: mediaType.rawValue)
    }
    
}
