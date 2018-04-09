//
//  MediaServiceImpl.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MediaServiceImpl: MediaService {
    
    var apiProvider: ApiProvier!
    let errorMessage = "Failed loading results. Check you internet connection!"
    
    init(apiProvider: ApiProvier) {
        self.apiProvider = apiProvider
    }
    
    func searchMedia(
        with keyword: String,
        media: String,
        limit: Int,
        country: String,
        success: @escaping ([MediaParser.RawMediaReponse]) -> (),
        failure: @escaping (String) -> ()) {
            let request = MediaSearchRequest(entity: media, limit: limit, term: keyword, country: country)
            apiProvider.make(request) { [weak self] (data) in
                guard let strongSelf = self else { return }
                guard let data = data,
                    let parsedMedia = try? JSONDecoder().decode(MediaParser.self, from: data) else {
                        failure(strongSelf.errorMessage)
                        return
                }
                success(parsedMedia.results)
            }
    }
    
}
