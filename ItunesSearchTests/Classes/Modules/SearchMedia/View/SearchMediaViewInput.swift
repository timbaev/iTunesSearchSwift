//
//  SearchMediaViewInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol SearchMediaViewInput: class {
    
    //Setters
    func set(cellModels models: [SearchMediaCellModel])
    func set(image: UIImage, at indexPath: IndexPath)
    
    /// Configure tabel view
    func prepareTableView()
    
    /// Reload table view
    func reloadTableView()
    
    /// Remove all data from tableView
    func clearAllData()
    
    /// Configure search bar
    func prepareSearchController()
    
    /// Configure tableView datasource and delegates
    func prepareDatasource()
    
}
