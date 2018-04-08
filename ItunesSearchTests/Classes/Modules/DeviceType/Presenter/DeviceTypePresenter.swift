//
//  DeviceTypePresenter.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DeviceTypePresenter: DeviceTypeViewOutput, DeviceTypeInteractorOutput {
    
    weak var view: DeviceTypeViewInput!
    var interactor: DeviceTypeInteractorInput!
    var router: DeviceTypeRouterInput!
    
    var lastCheckedIndexPath: IndexPath?
    
    //MARK: - View output
    
    func viewIsReady() {
        interactor.prepareData()
    }
    
    func onViewDidAppear() {
        interactor.prepareCheckmark()
    }
    
    func updateNumberOfRows() {
        interactor.updateNumberOfRows()
    }
    
    func updateTitle(at indexPath: IndexPath) {
        interactor.updateTitle(at: indexPath.row)
    }
    
    func didSelectDeviceType(at indexPath: IndexPath) {
        guard indexPath != lastCheckedIndexPath else { return }
        view.setCheckedCell(at: indexPath)
        if let lastCheckedIndexPath = self.lastCheckedIndexPath {
            view.setUncheckedCell(at: lastCheckedIndexPath)
        }
        interactor.saveDeviceTypeSetting(with: indexPath.row)
        lastCheckedIndexPath = indexPath
    }
    
    //MARK: - Interactor output
    
    func didUpdateNumberOfRows(_ count: Int) {
        view.set(numberOfRows: count)
    }
    
    func didUpdateTitle(_ title: String) {
        view.set(currentTitle: title)
    }
    
    func didUpdateCheckmark(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        view.setCheckedCell(at: indexPath)
        lastCheckedIndexPath = indexPath
    }
    
}
