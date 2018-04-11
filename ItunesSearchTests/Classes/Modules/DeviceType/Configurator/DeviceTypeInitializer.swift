//
//  DeviceTypeInitializer.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DeviceTypeInitializer: NSObject {
    
    @IBOutlet weak var viewController: DeviceTypeViewController!
    
    override func awakeFromNib() {
        let configurator = DeviceTypeConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
