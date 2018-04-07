//
//  CountOfMediaInitializer.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class CountOfMediaInitializer: NSObject {
    
    @IBOutlet weak var viewController: CountOfMediaViewController!
    
    override func awakeFromNib() {
        let configurator = CountOfMediaConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
