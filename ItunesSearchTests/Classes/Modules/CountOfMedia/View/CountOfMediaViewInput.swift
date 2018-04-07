//
//  CountOfMediaViewInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol CountOfmediaViewInput: class {
    
    //Setters
    func set(numberOfComponents currentNumber: Int)
    func set(numberOfCountRows currentNumber: Int)
    func set(titleOfRow currentTitle: String)
    func set(selectedRow indexOfRow: Int)
    
    /// Configurate initial settings of PickerView
    func preparePickerView()
    
}
