//
//  MediaTypePresenter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MediaTypePresenter: MediaTypeViewOutput, MediaTypeInteractorOutput {
    
    weak var view: MediaTypeViewInput!
    var interactor: MediaTypeInteractorInput!
    var router: MediaTypeRouterInput!
    
    //MARK: - View input
    
    func viewIsReady() {
        interactor.prepareMediaTypes()
    }
    
    func getCountOfMediaTypes() {
        interactor.getCountOfMediaTypes()
    }
    
    func updateMediaTypeTitle(at indexPath: IndexPath) {
        interactor.getTitleForMediaType(at: indexPath.row)
    }
    
    //MARK: - Interactor output
    
    func didGetCountOfMediaTypes(_ count: Int) {
        view.set(numberOfRows: count)
    }
    
    func didGetTitleForMediaType(_ title: String) {
        view.set(mediaTitle: title)
    }
    
}
