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
    /// - Parameter keyword: keyword for search
    func searchMedia(with keyword: String)
    
}
