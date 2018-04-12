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
    struct RawMediaReponse: Codable, Equatable {
        let trackName: String
        let artistName: String
        let shortDescription: String?
        let trackPrice: Double?
        let artworkUrl60: URL
        let trackViewUrl: URL
        let supportedDevices: [String]?
        
        init(
            trackName: String,
            artistName: String,
            shortDescription: String?,
            trackPrice: Double?,
            artworkUrl60: URL,
            trackViewUrl: URL,
            supportedDevices: [String]?) {
                self.trackName = trackName
                self.artistName = artistName
                self.shortDescription = shortDescription
                self.trackPrice = trackPrice
                self.artworkUrl60 = artworkUrl60
                self.trackViewUrl = trackViewUrl
                self.supportedDevices = supportedDevices
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.artistName = try values.decode(String.self, forKey: .artistName)
            
            print("*** Parse debug ***")
            print("artist name parsed: \(artistName)")
            
            if let trackName = try values.decodeIfPresent(String.self, forKey: .trackName) {
                self.trackName = trackName
            } else {
                self.trackName = try values.decode(String.self, forKey: .collectionName)
            }
            
            print("track name parsed: \(trackName)")
            
            if let shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription) {
                self.shortDescription = shortDescription
            } else {
                self.shortDescription = try values.decodeIfPresent(String.self, forKey: .description)
            }
            
            print("short description parsed: \(String(describing: shortDescription))")
            
            if let trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice) {
                self.trackPrice = trackPrice
            } else if let price = try values.decodeIfPresent(Double.self, forKey: .price) {
                self.trackPrice = price
            } else {
                self.trackPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
            }
            
            print("track price parsed: \(String(describing: trackPrice))")
            
            if let trackViewUrl = try values.decodeIfPresent(URL.self, forKey: .trackViewUrl) {
                self.trackViewUrl = trackViewUrl
            } else {
                self.trackViewUrl = try values.decode(URL.self, forKey: .collectionViewUrl)
            }
            
            print("treck View Url parsed: \(trackViewUrl)")
            
            self.artworkUrl60 = try values.decode(URL.self, forKey: .artworkUrl60)
            
            print("artwork Url parsed: \(artworkUrl60)")
            
            self.supportedDevices = try values.decodeIfPresent([String].self, forKey: .supportedDevices)
            
            print("supported device parsed")
            
            print("*** End parse debug ***")
            print("")
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(trackName, forKey: .trackName)
            try container.encode(artistName, forKey: .artistName)
            try container.encodeIfPresent(shortDescription, forKey: .shortDescription)
            try container.encodeIfPresent(trackPrice, forKey: .trackPrice)
            try container.encode(artworkUrl60, forKey: .artworkUrl60)
            try container.encode(trackViewUrl, forKey: .trackViewUrl)
            try container.encodeIfPresent(supportedDevices, forKey: .supportedDevices)
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
            case trackViewUrl
            case collectionViewUrl
            case supportedDevices
        }
    }
    
}
