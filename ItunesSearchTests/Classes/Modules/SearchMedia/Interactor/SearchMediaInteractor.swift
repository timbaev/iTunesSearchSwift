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
    
    let defaultMediaType: MediaTypes = .movie
    let defaultCountOfResults = 1
    let defaultCountry = "RU"
    
    func searchMedia(with keyword: String) {
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
            success: { [weak self] (result) in
                guard let strongSelf = self else { return }
                
                let mediaList = result.map {
                    Media(
                        name       : $0.trackName,
                        author     : $0.artistName,
                        description: $0.shortDescription,
                        price      : $0.trackPrice,
                        imageURL   : $0.artworkUrl60
                    )
                }
                
                strongSelf.presenter.didLoadSearchMediaResult(with: .success(mediaList))
        }) { [weak self] (errorMessage) in
            guard let strongSelf = self else { return }
            strongSelf.presenter.didLoadSearchMediaResult(with: .failure(errorMessage))
        }
    }
    
}
