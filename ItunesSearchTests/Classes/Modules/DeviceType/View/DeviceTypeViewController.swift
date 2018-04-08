//
//  DeviceTypeViewController.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 08.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class DeviceTypeViewController: UIViewController, DeviceTypeViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DeviceTypeViewOutput!
    
    //Datasource variables
    var cellIdentifier = "deviceTypeCell"
    var currentNumberOfRows: Int?
    var currentTitle: String?
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.onViewDidAppear()
    }
    
    //MARK: - View input
    
    func set(numberOfRows number: Int) {
        currentNumberOfRows = number
    }
    
    func set(currentTitle title: String) {
        currentTitle = title
    }
    
    func setCheckedCell(at indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .checkmark
    }
    
    func setUncheckedCell(at indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .none
    }
    
}

extension DeviceTypeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.updateNumberOfRows()
        return currentNumberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        presenter.updateTitle(at: indexPath)
        cell.textLabel?.text = currentTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectDeviceType(at: indexPath)
    }
    
}
