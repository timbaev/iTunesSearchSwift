//
//  MediaParser.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

struct MediaParser: Codable {
    
    let results: [RawMediaReponse]
    struct RawMediaReponse: Codable {
        let trackName: String
        let artistName: String
        let shortDescription: String
        let trackPrice: Double
        let artworkUrl60: URL
    }
    
}
