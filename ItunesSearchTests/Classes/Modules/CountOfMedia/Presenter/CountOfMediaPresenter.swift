//
//  CountOfMediaPresenter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class CountOfMediaPresenter: CountOfMediaViewOutput, CountOfMediaInteractorOutput {
    
    weak var view: CountOfmediaViewInput!
    var interactor: CountOfMediaInteractorInput!
    var router: CountOfMediaRotuerInput!
    
}
