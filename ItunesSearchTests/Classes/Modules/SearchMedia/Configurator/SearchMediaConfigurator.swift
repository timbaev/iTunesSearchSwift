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
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = viewController
    }
    
}
