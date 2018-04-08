//
//  SearchMediaCellModelImpl.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

struct SearchMediaCellModelImpl: SearchMediaCellModel {
    
    var name: String
    var author: String
    var description: String?
    var imageURL: URL
    var price: Double
    var viewURL: URL
    
    init(media: Media) {
        self.name = media.name
        self.author = media.author
        self.description = media.description
        self.price = media.price
        self.imageURL = media.imageURL
        self.viewURL = media.viewURL
    }
    
}
