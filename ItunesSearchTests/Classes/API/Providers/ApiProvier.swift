//
//  ApiProvier.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ApiProvier {
    
    var baseURL: URL { get }
    
    func make(_ request: Request, completionBlock: @escaping (Data?) -> ())
    
}
