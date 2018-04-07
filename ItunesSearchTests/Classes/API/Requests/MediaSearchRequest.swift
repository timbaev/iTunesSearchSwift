//
//  MediaSearchRequest.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

class MediaSearchRequest: Request {
    
    var method: HTTPMethod = .get
    var endPoint = "search"
    var parameters: [String : Any]
    
    let countryKey = "country"
    let termKey = "term"
    let mediaKey = "media"
    let limitKey = "limit"
    
    init(media: String, limit: Int, term: String, country: String) {
        self.parameters = [termKey: term, mediaKey: media, limitKey: limit, countryKey: country]
    }
    
}
