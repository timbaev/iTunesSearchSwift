//
//  CountOfMediaViewOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol CountOfMediaViewOutput: class {
    
    /// View did load trigger
    func viewIsReady()
    
    /// View will appear trigger
    func onViewWillAppear()
    
    /// Update number of components
    func updateNumberOfComponents()
    
    /// Update current title for row
    ///
    /// - Parameter index: index of row
    func updateTitleForRow(for index: Int)
    
    /// Select count of media
    ///
    /// - Parameter index: index of row position
    func didSelectCountOfMedia(at index: Int)
    
    /// Update number of rows
    func updateNumberOfRows()
    
}
