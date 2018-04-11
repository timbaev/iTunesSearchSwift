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
    let entityKey = "entity"
    let limitKey = "limit"
    let sortKey = "sort"
    
    init(entity: String, limit: Int, term: String, country: String, sort: String = "popular") {
        self.parameters = [termKey: term, entityKey: entity, limitKey: limit, countryKey: country, sortKey: sort]
    }
    
}
