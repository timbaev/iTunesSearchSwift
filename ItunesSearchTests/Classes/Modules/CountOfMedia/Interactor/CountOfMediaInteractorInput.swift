//
//  CountOfMediaInteractorInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol CountOfMediaInteractorInput: class {
    
    /// Prepare data
    func prepareData()
    
    /// Get number of counts
    func getNumberOfCount()
    
    /// Get title for row
    ///
    /// - Parameter index: index of row
    func getTitleForRow(at index: Int)
    
    /// Save count of media results
    ///
    /// - Parameter index: index of selected row
    func saveCountOfMedia(with index: Int)
    
    /// Get saved count of media setting
    func getSaveCountOfMedia()
    
}
