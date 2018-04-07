//
//  MediaTypeInteractorInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MediaTypeInteractorInput: class {
    
    /// Get count of media types
    func getCountOfMediaTypes()
    
    /// Get title for media type
    ///
    /// - Parameter index: index of media type
    func getTitleForMediaType(at index: Int)
    
     /// Prepare data for cells
    func prepareMediaTypes()
    
    /// Save media type settings
    ///
    /// - Parameter index: index of media type
    func saveMediaTypeSetting(with index: Int)
    
    /// Prepare checkmark for tableView cell
    func prepareCheckmark()
    
}
