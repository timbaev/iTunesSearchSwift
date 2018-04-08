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
        view.prepareDatasource()
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
    
    func didLoadImage(with result: Result<ImageModel>, at indexPath: IndexPath) {
        switch result {
        case .success(let imageModel):
            view.set(image: imageModel.image, at: indexPath)
            break
        case .failure(let errorMessage):
            router.showErrorAlert(with: errorMessage)
            break
        }
    }
    
}

//MARK: - Download image delegate
extension SearchMediaPresenter: DownloadImageDelgate {
    
    func downloadImage(from url: URL, at indexPath: IndexPath) {
        interactor.downloadImage(from: url, at: indexPath)
    }
    
}

//MARK: - Cell select delegate
extension SearchMediaPresenter: OnCellSelectDelegate {
    
    func showPreview(with url: URL) {
        router.showWebPage(with: url)
    }
    
}
