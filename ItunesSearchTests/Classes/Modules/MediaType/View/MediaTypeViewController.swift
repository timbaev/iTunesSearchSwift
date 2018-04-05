//
//  MediaTypeViewController.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 06.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class MediaTypeViewController: UIViewController, MediaTypeViewInput {
    
    var presenter: MediaTypeViewOutput!
    
    //TableView datasource fields
    var cellIdentifier = "mediaTypeCell"
    var currentNumberOfRows: Int?
    var currentMediaTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    //MARK: - View input
    
    func set(numberOfRows currentNumberOfRows: Int) {
        self.currentNumberOfRows = currentNumberOfRows
    }
    
    func set(mediaTitle currentMediaTitle: String) {
        self.currentMediaTitle = currentMediaTitle
    }
    
}

extension MediaTypeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getCountOfMediaTypes()
        return currentNumberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        presenter.updateMediaTypeTitle(at: indexPath)
        cell.textLabel?.text = currentMediaTitle
        return cell
    }
    
}
