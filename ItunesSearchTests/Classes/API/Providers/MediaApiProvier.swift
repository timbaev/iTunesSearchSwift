//
//  SearchMediaApiProvier.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

class MediaApiProvider: ApiProvier {
    
    var baseURL = URL(string: "https://itunes.apple.com")!
    
    func make(_ request: Request, completionBlock: @escaping (Data?) -> ()) {
        let url = baseURL.appendingPathComponent(request.endPoint)
        Alamofire.request(url, method: request.method, parameters: request.parameters)
            .validate()
            .responseData { (response) in
                guard response.result.isSuccess else {
                    print("Error while make request: \(String(describing: response.result.error))")
                    completionBlock(nil)
                    return
                }
                
                guard let data = response.result.value else {
                    print("No data found in response")
                    completionBlock(nil)
                    return
                }
                let printableData = String(data: data, encoding: .utf8)
                print("*** Response Data ***")
                print(printableData ?? "None")
                print("*** End Response ***")
                completionBlock(data)
        }
    }
    
}
