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
    
    private let numberOfComponents = 1
    
    //MARK: - View output
    
    func viewIsReady() {
        interactor.prepareData()
    }
    
    func onViewWillAppear() {
        interactor.getSaveCountOfMedia()
    }
    
    func updateNumberOfComponents() {
        view.set(numberOfComponents: numberOfComponents)
    }
    
    func updateNumberOfRows() {
        interactor.getNumberOfCount()
    }
    
    func updateTitleForRow(for index: Int) {
        interactor.getTitleForRow(at: index)
    }
    
    func didSelectCountOfMedia(at index: Int) {
        interactor.saveCountOfMedia(with: index)
    }
    
    //MARK: - Interactor ouput
    
    func didGettingNumberOfCount(_ number: Int) {
        view.set(numberOfRows: number)
    }
    
    func didGettingTitleForRow(_ title: String) {
        view.set(titleOfRow: title)
    }
    
    func didGettingCountOfMediaResults(indexOfResult: Int) {
        view.set(selectedRow: indexOfResult)
    }
    
    func didFinishPrepareData() {
        view.preparePickerView()
    }
    
}
