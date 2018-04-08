//
//  SearchMediaDatasource.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class SearchMediaDatasource: NSObject, SearchMediaDatasourceInput {
    
    private var cellModels = [SearchMediaCellModel]()
    var selectDelegate: OnCellSelectDelegate?
    
    //MARK: - Datasource input
    
    func set(cellModels models: [SearchMediaCellModel]) {
        cellModels = models
    }
    
    func clear() {
        cellModels.removeAll()
    }
    
    //MARK: - TableView datasource and delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .searchMedia, for: indexPath) as! SearchMediaTableViewCell
        let model = cellModels[indexPath.row]
        cell.prepareCell(with: model)
        return cell
    }
    
}
