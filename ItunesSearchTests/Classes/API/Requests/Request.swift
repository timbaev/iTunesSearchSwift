//
//  Request.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

protocol Request {
    
    var method: HTTPMethod { get }
    var endPoint: String { get }
    var parameters: [String: Any] { get }
    
}
