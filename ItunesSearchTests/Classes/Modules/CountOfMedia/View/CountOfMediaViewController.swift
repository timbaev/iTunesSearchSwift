//
//  CountOfMediaViewController.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class CountOfMediaViewController: UIViewController, CountOfmediaViewInput {
    
    @IBOutlet weak var countPickerView: UIPickerView!
    
    var presenter: CountOfMediaViewOutput!
    
    //MARK: - PickerView variables
    var currentNumberOfComponents: Int?
    var currentNumberOfCountRows: Int?
    var currentTitleOfRow: String?
    
    //MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.onViewWillAppear()
    }
    
    //MARK: - View input
    
    func preparePickerView() {
        countPickerView.delegate = self
        countPickerView.dataSource = self
    }
    
    func set(numberOfComponents currentNumber: Int) {
        currentNumberOfComponents = currentNumber
    }
    
    func set(numberOfCountRows currentNumber: Int) {
        currentNumberOfCountRows = currentNumber
    }
    
    func set(titleOfRow currentTitle: String) {
        currentTitleOfRow = currentTitle
    }
    
    func set(selectedRow indexOfRow: Int) {
        countPickerView.selectRow(indexOfRow, inComponent: 0, animated: true)
    }
    
}

//MARK: - PickerView delegate and datasource
extension CountOfMediaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        presenter.updateNumberOfComponents()
        return currentNumberOfComponents ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        presenter.updateNumberOfRows()
        return currentNumberOfCountRows ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        presenter.updateTitleForRow(for: row)
        return currentTitleOfRow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        presenter.didSelectCountOfMedia(at: row)
    }
    
}
