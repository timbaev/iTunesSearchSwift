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
    var downloadImageDelegate: DownloadImageDelegate?
    
    //MARK: - Datasource input
    
    func set(cellModels models: [SearchMediaCellModel]) {
        cellModels = models
    }
    
    func clear() {
        cellModels.removeAll()
    }
    
    func set(image: UIImage, to cell: UITableViewCell) {
        guard let mediaCell = cell as? SearchMediaTableViewCell else { return }
        mediaCell.mediaImageView.image = image
    }
    
    //MARK: - TableView datasource and delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .searchMedia, for: indexPath) as! SearchMediaTableViewCell
        let model = cellModels[indexPath.row]
        downloadImageDelegate?.downloadImage(from: model.imageURL, at: indexPath)
        cell.prepareCell(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = cellModels[indexPath.row]
        selectDelegate?.showPreview(with: model.viewURL)
    }
    
}
