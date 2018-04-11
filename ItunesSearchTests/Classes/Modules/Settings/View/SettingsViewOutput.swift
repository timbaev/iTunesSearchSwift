//
//  SettingsViewOutput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SettingsViewOutput: class {
    
    /// View did load trigger
    func viewIsReady()
    
    /// Veiw will appear trigger
    func onViewWillAppear()
    
    /// Select setting row
    ///
    /// - Parameter indexPath: index of setting cell
    func didSelectSettingRow(at indexPath: IndexPath)
    
}
