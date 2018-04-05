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
    var mediaTypes = [MediaTypes]()
    
    func prepareMediaTypes() {
        self.mediaTypes = MediaTypes.allValues
    }
    
    func getCountOfMediaTypes() {
        presenter.didGetCountOfMediaTypes(mediaTypes.count)
    }
    
    func getTitleForMediaType(at index: Int) {
        let title = mediaTypes[index].rawValue
        presenter.didGetTitleForMediaType(title)
    }
    
}
