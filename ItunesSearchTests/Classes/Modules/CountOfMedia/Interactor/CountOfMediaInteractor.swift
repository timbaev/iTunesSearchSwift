//
//  CountOfMediaInteractor.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class CountOfMediaInteractor: CountOfMediaInteractorInput {
    
    weak var presenter: CountOfMediaInteractorOutput!
    var settingsUserDefaultsManager: SettingsUserDefaultsManager!
    
    var numberArray = [Int]()
    let startCount = 1
    let endCount = 200
    
    func prepareData() {
        var numberArray = [Int]()
        for number in startCount...endCount {
            numberArray.append(number)
        }
        self.numberArray = numberArray
        presenter.didFinishPrepareData()
    }
    
    func getNumberOfCount() {
        presenter.didGettingNumberOfCount(numberArray.count)
    }
    
    func getTitleForRow(at index: Int) {
        let title = "\(numberArray[index])"
        presenter.didGettingTitleForRow(title)
    }
    
    func saveCountOfMedia(with index: Int) {
        let count = numberArray[index]
        settingsUserDefaultsManager.save(countOfResults: count)
    }
    
    func getSaveCountOfMedia() {
        let countOfMedia = settingsUserDefaultsManager.getCountOfResults()
        guard let index = numberArray.index(of: countOfMedia) else { return }
        presenter.didGettingCountOfMediaResults(indexOfResult: index)
    }
    
}
