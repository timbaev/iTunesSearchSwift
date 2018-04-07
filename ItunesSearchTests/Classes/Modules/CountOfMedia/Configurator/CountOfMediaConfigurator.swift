//
//  CountOfMediaConfigurator.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class CountOfMediaConfigurator {
    
    func setupModule(with viewController: CountOfMediaViewController) {
        let presenter = CountOfMediaPresenter()
        let interactor = CountOfMediaInteractor()
        let router = CountOfMediaRotuer()
        
        let settingsUserDafaultsManager = SettingsUserDefaultsManagerImpl()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.settingsUserDefaultsManager = settingsUserDafaultsManager
        
        router.viewController = viewController
    }
    
}
