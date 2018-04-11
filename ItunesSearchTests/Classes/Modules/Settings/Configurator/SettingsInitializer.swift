//
//  SettingsInitializer.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SettingsInitializer: NSObject {
    
    @IBOutlet weak var viewController: SettingsViewController!
    
    override func awakeFromNib() {
        let configurator = SettingsConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
