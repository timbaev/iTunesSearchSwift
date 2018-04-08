//
//  SearchMediaInteractor.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SearchMediaInteractor: SearchMediaInteractorInput {
    
    weak var presenter: SearchMediaInteractorOutput!
    var settingsUserDefaultsManager: SettingsUserDefaultsManager!
    var mediaServie: MediaService!
    var imageDownloadManager: ImageDownloadManager!
    
    let defaultMediaType: MediaTypes = .movie
    let defaultCountOfResults = 1
    let defaultCountry = "US"
    let minimalTextSearchLength = 3
    let searchDelay = 0.5
    
    var timer: Timer?
    
    //MARK: - Interactor input
    
    func searchMedia(with text: String) {
        timer?.invalidate()
        
        guard text.count > minimalTextSearchLength else { return }
        timer = Timer.scheduledTimer(withTimeInterval: searchDelay, repeats: false, block: { [weak self] (timer) in
            guard let strongSelf = self else { return }
            strongSelf.delayedSearchMedia(with: text)
        })
    }
    
    func downloadImage(from url: URL, at indexPath: IndexPath) {
        imageDownloadManager.downloadImage(from: url, success: { [weak self] (image) in
            guard let strongSelf = self else { return }
            guard let image = image else { return }
            
            let imageModel = ImageModel(image: image)
            strongSelf.presenter.didLoadImage(with: .success(imageModel), at: indexPath)
        }) { [weak self] (errorMessage) in
            guard let strongSelf = self else { return }
            strongSelf.presenter.didLoadImage(with: .failure(errorMessage), at: indexPath)
        }
    }
    
    //MARK: - Private methods
    
    private func delayedSearchMedia(with keyword: String) {
        var mediaType = defaultMediaType
        var countOfResults = defaultCountOfResults
        
        if let savedMediaType = settingsUserDefaultsManager.getMediaType() {
            mediaType = savedMediaType
        }
        
        let savedCountOfResults = settingsUserDefaultsManager.getCountOfResults()
        if savedCountOfResults != 0 {
            countOfResults = savedCountOfResults
        }
        
        mediaServie.searchMedia(
            with   : keyword,
            media  : mediaType.rawValue,
            limit  : countOfResults,
            country: defaultCountry,
            success: { (result) in
                let mediaList = result.map {
                    Media(
                        name       : $0.trackName,
                        author     : $0.artistName,
                        description: $0.shortDescription,
                        price      : $0.trackPrice,
                        imageURL   : $0.artworkUrl60,
                        viewURL    : $0.trackViewUrl
                    )
                }
                
                DispatchQueue.main.async { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.presenter.didLoadSearchMediaResult(with: .success(mediaList))
                }
        }) { (errorMessage) in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.presenter.didLoadSearchMediaResult(with: .failure(errorMessage))
            }
        }
    }
    
}
