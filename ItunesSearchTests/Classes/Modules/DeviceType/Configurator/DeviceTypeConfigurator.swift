//
//  DeviceTypeConfigurator.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DeviceTypeConfigurator {
    
    func setupModule(with viewController: DeviceTypeViewController) {
        let presenter = DeviceTypePresenter()
        let interactor = DeviceTypeInteractor()
        let rotuer = DeviceTypeRouter()
        
        let settingsUserDefaultsManager = SettingsUserDefaultsManagerImpl()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = rotuer
        
        rotuer.view = viewController
        
        interactor.presenter = presenter
        interactor.settingsUserDefaultsManager = settingsUserDefaultsManager
    }
    
}
