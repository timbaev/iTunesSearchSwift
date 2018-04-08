//
//  SearchMediaCellModel.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol SearchMediaCellModel {
    
    var name: String { get set }
    var author: String { get set }
    var description: String? { get set }
    var imageURL: URL { get set }
    var price: Double { get set }
    var viewURL: URL { get set }
    
}
