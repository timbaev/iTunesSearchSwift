//
//  CountOfMediaInteractorOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol CountOfMediaInteractorOutput: class {
    
    /// Result with number of counts
    ///
    /// - Parameter number: count
    func didGettingNumberOfCount(_ number: Int)
    
    /// Result with title for row
    ///
    /// - Parameter title: text title
    func didGettingTitleForRow(_ title: String)
    
    /// Result with index of row
    ///
    /// - Parameter indexOfResult: index of result
    func didGettingCountOfMediaResults(indexOfResult: Int)
    
    /// Data is ready
    func didFinishPrepareData()
    
}
