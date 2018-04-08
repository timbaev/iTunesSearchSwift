//
//  SearchMediaPresenter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SearchMediaPresenter: SearchMediaViewOutput, SearchMediaInteractorOutput {
    
    weak var view: SearchMediaViewInput!
    var interactor: SearchMediaInteractorInput!
    var router: SearchMediaRouterInput!
    
    //MARK: - View output
    
    func viewIsReady() {
        view.prepareTableView()
        view.prepareSearchController()
    }
    
    func didUpdateSearchText(_ text: String) {
        if text.isEmpty {
            view.clearAllData()
            view.reloadTableView()
        } else {
            interactor.searchMedia(with: text)
        }
    }
    
    //MARK: - Interactor output
    
    func didLoadSearchMediaResult(with result: ArrayResult<Media>) {
        switch result {
        case .success(let mediaList):
            let cellModels = mediaList.map { SearchMediaCellModelImpl(media: $0) }
            view.set(cellModels: cellModels)
            view.reloadTableView()
            break
        case .failure(let errorMessage):
            router.showErrorAlert(with: errorMessage)
            break
        }
    }
    
}
