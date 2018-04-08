//
//  ImageDownloadManager.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol ImageDownloadManager: class {
    
    /// Download image from URL
    ///
    /// - Parameters:
    ///   - url: url to image
    ///   - success: success result with image
    ///   - failure: failure result with error message
    func downloadImage(from url: URL, success: @escaping (UIImage?) -> Void, failure: @escaping (String) -> Void)
    
}
