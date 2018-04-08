//
//  SearchMediaInitializer.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SearchMediaInitializer: NSObject {
    
    @IBOutlet weak var viewController: SearchMediaViewController!
    
    override func awakeFromNib() {
        let configurator = SearchMediaConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
