//
//  MediaTypes.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

enum MediaTypes: String {
    case movie
    case podcast
    case music
    case musicVideo = "music video"
    case audiobook
    case shortFilm = "short firm"
    case tvShow = "tv show"
    case software
    case ebook
    
    static let allValues: [MediaTypes] = [.movie, .podcast, .music, .musicVideo, .audiobook, .shortFilm, .tvShow, .software, .ebook]
}
