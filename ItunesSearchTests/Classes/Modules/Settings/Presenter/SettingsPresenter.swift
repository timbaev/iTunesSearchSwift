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
    
    private let mainSection = 0
    private let softwareSection = 1
    
    private let mediaTypeIndex = 0
    private let countSettingIndex = 1
    private let deviceTypeIndex = 0
    
    //MARK: - View output
    
    func viewIsReady() {
        view.prepareTableView()
    }
    
    func onViewWillAppear() {
        interactor.prepareSettingsScrren()
    }
    
    func didSelectSettingRow(at indexPath: IndexPath) {
        let settingIndex = indexPath.row
        let settingSection = indexPath.section
        
        if settingSection == mainSection {
            if settingIndex == mediaTypeIndex {
                router.showMediaTypesScreen()
            } else if settingIndex == countSettingIndex {
                router.showCountOfMediaScreen()
            }
        } else if settingSection == softwareSection {
            if settingIndex == deviceTypeIndex {
                router.showDeviceTypeScreen()
            }
        }
    }
    
    //MARK: - Interactor output
    
    func didGetSavedMediaType(_ mediaType: MediaTypes) {
        view.set(mediaTypeTitle: mediaType.rawValue)
    }
    
    func didGettingSavedCountOfResults(_ count: Int) {
        let countString = "\(count)"
        view.set(countOfMediaResultsTitle: countString)
    }
    
    func didGetSavedDeviceType(_ deviceType: DeviceTypes) {
        view.set(deviceTypeTitle: deviceType.rawValue)
    }
    
}
