//
//  MediaTypeInitializer.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MediaTypeInitializer: NSObject {
    
    @IBOutlet weak var viewController: MediaTypeViewController!
    
    override func awakeFromNib() {
        let configurator = MediaTypeConfigurator()
        configurator.setupModel(with: viewController)
    }
    
}
