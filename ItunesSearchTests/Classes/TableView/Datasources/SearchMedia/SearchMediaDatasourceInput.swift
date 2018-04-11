//
//  SearchMediaDatasourceInput.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol SearchMediaDatasourceInput: UITableViewDelegate, UITableViewDataSource {
    
    var selectDelegate: OnCellSelectDelegate? { get set }
    var downloadImageDelegate: DownloadImageDelegate? { get set }
    
    //Setters
    func set(cellModels models: [SearchMediaCellModel])
    func set(image: UIImage, to cell: UITableViewCell)
    
    /// Delete all data
    func clear()
    
}
