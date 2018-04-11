//
//  MediaTypeViewOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MediaTypeViewOutput: class {
    
    /// View did load trigger
    func viewIsReady()
    
    /// View did appear trigger
    func onViewDidAppear()
    
    /// Get count of allow media types
    func getCountOfMediaTypes()
    
    /// Update title of media type
    ///
    /// - Parameter indexPath: index of cell with media type info
    func updateMediaTypeTitle(at indexPath: IndexPath)
    
    /// Select media type cell
    ///
    /// - Parameter indexPath: index of position of cell
    func didSelectMediaType(at indexPath: IndexPath)
    
}
