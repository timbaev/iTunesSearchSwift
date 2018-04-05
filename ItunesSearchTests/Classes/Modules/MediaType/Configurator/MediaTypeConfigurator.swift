//
//  MediaTypeConfigurator.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MediaTypeConfigurator {
    
    func setupModel(with viewController: MediaTypeViewController) {
        let presenter = MediaTypePresenter()
        let interactor = MediaTypeInteractor()
        let rotuer = MediaTypeRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = rotuer
        
        interactor.presenter = presenter
        
        rotuer.viewController = viewController
    }
    
}
