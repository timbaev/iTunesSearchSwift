//
//  SettingsConfigurator.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SettingsConfigurator {
    
    func setupModule(with viewController: SettingsViewController) {
        let presenter = SettingsPreseter()
        let interactor = SettingsInteractor()
        let router = SettingsRouter()
        
        let settingsUserDefaultsManager = SettingsUserDefaultsManagerImpl()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.settingsUserDefaultsManager = settingsUserDefaultsManager
        
        router.viewController = viewController
    }
    
}
