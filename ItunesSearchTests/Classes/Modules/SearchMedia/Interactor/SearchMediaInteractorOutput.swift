//
//  SearchMediaInteractorOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SearchMediaInteractorOutput: class {
    
    /// Search media result
    ///
    /// - Parameter result: enum with media list or error message
    func didLoadSearchMediaResult(with result: ArrayResult<Media>)
    
}
