//
//  SearchMediaViewOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SearchMediaViewOutput: class {
    
    /// ViewDidLoad trigger
    func viewIsReady()
    
    /// Update search query trigger
    ///
    /// - Parameter text: text for search
    func didUpdateSearchText(_ text: String)
    
}
