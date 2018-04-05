//
//  ModuleInputHolder.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 26.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Helper to provide to module input class
protocol ModuleInputHolder {
    
    var moduleInput: ModuleInput? { get }
    
}
