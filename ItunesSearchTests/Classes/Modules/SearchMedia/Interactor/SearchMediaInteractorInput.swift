//
//  SearchMediaInteractorInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SearchMediaInteractorInput: class {
    
    /// Search media
    ///
    /// - Parameter text: text for search
    func searchMedia(with text: String)
    
    /// Download image from url
    ///
    /// - Parameters:
    ///   - url: url link to image
    ///   - indexPath: index of image poistion in tableViews
    func downloadImage(from url: URL, at indexPath: IndexPath)
    
}
