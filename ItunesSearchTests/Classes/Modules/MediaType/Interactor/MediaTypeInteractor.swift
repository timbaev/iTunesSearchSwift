//
//  MediaTypeInteractor.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MediaTypeInteractor: MediaTypeInteractorInput {
    
    weak var presenter: MediaTypeInteractorOutput!
    var settingsUserDefaultsManager: SettingsUserDefaultsManager!
    
    var mediaTypes = [MediaTypes]()
    let defaultPosition = 0
    
    func prepareMediaTypes() {
        mediaTypes = MediaTypes.allValues
    }
    
    func prepareCheckmark() {
        guard let savedMediaType = settingsUserDefaultsManager.getMediaType(),
            let indexOfMediaType = mediaTypes.index(where: { $0 == savedMediaType }) else {
                presenter.setCheckedCell(at: defaultPosition)
                return
        }
        presenter.setCheckedCell(at: indexOfMediaType)
    }
    
    func getCountOfMediaTypes() {
        presenter.didGetCountOfMediaTypes(mediaTypes.count)
    }
    
    func getTitleForMediaType(at index: Int) {
        let title = mediaTypes[index].rawValue
        presenter.didGetTitleForMediaType(title)
    }
    
    func saveMediaTypeSetting(with index: Int) {
        let mediaType = mediaTypes[index]
        settingsUserDefaultsManager.save(mediaType: mediaType)
    }
    
}
