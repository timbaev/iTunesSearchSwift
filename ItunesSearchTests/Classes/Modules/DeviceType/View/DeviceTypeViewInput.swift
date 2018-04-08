//
//  DeviceTypeViewInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DeviceTypeViewInput: class {
    
    //Setters
    func set(numberOfRows number: Int)
    func set(currentTitle title: String)
    func setCheckedCell(at indexPath: IndexPath)
    func setUncheckedCell(at indexPath: IndexPath)
    
}
