//
//  DownloadImageDelegate.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DownloadImageDelegate {
    
    func downloadImage(from url: URL, at indexPath: IndexPath)
    
}
