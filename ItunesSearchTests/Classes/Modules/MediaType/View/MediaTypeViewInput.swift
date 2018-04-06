//
//  MediaTypeViewInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MediaTypeViewInput: class {
    
    //Setters
    func set(numberOfRows currentNumberOfRows: Int)
    func set(mediaTitle currentMediaTitle: String)
    func setCheckedCell(at indexPath: IndexPath)
    func setUncheckedCell(at indexPath: IndexPath)
    
}
