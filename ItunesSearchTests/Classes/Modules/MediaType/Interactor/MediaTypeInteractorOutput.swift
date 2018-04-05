//
//  MediaTypeInteractorOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MediaTypeInteractorOutput: class {
    
    /// Getting count of media types
    ///
    /// - Parameter count: count result
    func didGetCountOfMediaTypes(_ count: Int)
    
    /// Getting title of media type
    ///
    /// - Parameter title: title of media type
    func didGetTitleForMediaType(_ title: String)
    
}
