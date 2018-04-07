//
//  SettingsViewInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SettingsViewInput: class {
    
    //Setters
    func set(mediaTypeTitle title: String)
    func set(countOfMediaResultsTitle title: String)
    
    /// Prepare table view parameters
    func prepareTableView()
    
}
