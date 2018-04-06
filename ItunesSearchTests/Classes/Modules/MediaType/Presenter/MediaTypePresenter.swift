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
    
    var lastCheckedIndexPath: IndexPath?
    
    //MARK: - View input
    
    func viewIsReady() {
        interactor.prepareMediaTypes()
    }
    
    func onViewDidAppear() {
        interactor.prepareCheckmark()
    }
    
    func getCountOfMediaTypes() {
        interactor.getCountOfMediaTypes()
    }
    
    func updateMediaTypeTitle(at indexPath: IndexPath) {
        interactor.getTitleForMediaType(at: indexPath.row)
    }
    
    func didSelectMediaType(at indexPath: IndexPath) {
        view.setCheckedCell(at: indexPath)
        if let lastCheckedIndexPath = self.lastCheckedIndexPath {
            view.setUncheckedCell(at: lastCheckedIndexPath)
        }
        interactor.saveMediaTypeSetting(with: indexPath.row)
        lastCheckedIndexPath = indexPath
    }
    
    //MARK: - Interactor output
    
    func didGetCountOfMediaTypes(_ count: Int) {
        view.set(numberOfRows: count)
    }
    
    func didGetTitleForMediaType(_ title: String) {
        view.set(mediaTitle: title)
    }
    
    func setCheckedCell(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        view.setCheckedCell(at: indexPath)
        lastCheckedIndexPath = indexPath
    }
    
}
