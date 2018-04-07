//
//  SearchMediaPresenter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class SearchMediaPresenter: SearchMediaViewOutput, SearchMediaInteractorOutput {
    
    weak var view: SearchMediaViewInput!
    var interactor: SearchMediaInteractorInput!
    var router: SearchMediaRouterInput!
    
}
