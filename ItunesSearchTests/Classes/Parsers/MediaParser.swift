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
        var shortDescription: String?
        let trackPrice: Double
        let artworkUrl60: URL
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.artistName = try values.decode(String.self, forKey: .artistName)
            
            if let trackName = try values.decodeIfPresent(String.self, forKey: .trackName) {
                self.trackName = trackName
            } else {
                self.trackName = try values.decode(String.self, forKey: .collectionName)
            }
            
            self.shortDescription = nil
            if let shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription) {
                self.shortDescription = shortDescription
            } else if let description = try values.decodeIfPresent(String.self, forKey: .description) {
                self.shortDescription = description
            }
            
            if let trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice) {
                self.trackPrice = trackPrice
            } else if let price = try values.decodeIfPresent(Double.self, forKey: .price) {
                self.trackPrice = price
            } else {
                self.trackPrice = try values.decode(Double.self, forKey: .collectionPrice)
            }
            
            self.artworkUrl60 = try values.decode(URL.self, forKey: .artworkUrl60)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(trackName, forKey: .trackName)
            try container.encode(artistName, forKey: .artistName)
            try container.encode(shortDescription, forKey: .shortDescription)
            try container.encode(trackPrice, forKey: .trackPrice)
            try container.encode(artworkUrl60, forKey: .artworkUrl60)
        }
        
        enum CodingKeys: String, CodingKey {
            case trackName
            case collectionName
            case artistName
            case shortDescription
            case description
            case trackPrice
            case price
            case collectionPrice
            case artworkUrl60
        }
    }
    
}
