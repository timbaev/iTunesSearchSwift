//
//  MediaService.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MediaService {
    
    /// Search media from iTunes
    ///
    /// - Parameters:
    ///   - keyword: keyword for search
    ///   - media: media type
    ///   - limit: count of results
    ///   - country: country store
    ///   - success: success result with parsed list
    ///   - failure: failure result with error message
    func searchMedia(
        with keyword: String,
        media: String,
        limit: Int,
        country: String,
        success: @escaping ([MediaParser.RawMediaReponse]) -> (),
        failure: @escaping (String) -> ())
    
}
