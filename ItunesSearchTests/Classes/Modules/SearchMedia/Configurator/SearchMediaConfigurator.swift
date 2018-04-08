//
//  SearchMediaConfigurator.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SearchMediaConfigurator {
    
    func setupModule(with viewController: SearchMediaViewController) {
        let presenter = SearchMediaPresenter()
        let interactor = SearchMediaInteractor()
        let router = SearchMediaRouter()
        
        let searchMediaDatasource = SearchMediaDatasource()
        let settingsUserDefaultsManager = SettingsUserDefaultsManagerImpl()
        let mediaApiProvider = MediaApiProvider()
        let mediaService = MediaServiceImpl(apiProvider: mediaApiProvider)
        let commonAlertsFactory = CommonAlertsFactoryImpl()
        let imageDownloadManager = ImageDownloadManagerImpl()
        
        viewController.presenter = presenter
        viewController.searchMediaDatasource = searchMediaDatasource
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.settingsUserDefaultsManager = settingsUserDefaultsManager
        interactor.mediaServie = mediaService
        interactor.imageDownloadManager = imageDownloadManager
        
        router.viewController = viewController
        router.commonAlertsFactory = commonAlertsFactory
    }
    
}
