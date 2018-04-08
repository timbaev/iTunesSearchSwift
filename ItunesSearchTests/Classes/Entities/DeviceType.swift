//
//  DeviceType.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

enum DeviceTypes: String {
    case iPhone
    case iPad
    case all
    
    static let allValues: [DeviceTypes] = [.iPhone, .iPad, .all]
}
