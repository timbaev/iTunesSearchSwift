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
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - TableView datasource fields
    
    var cellIdentifier = "mediaTypeCell"
    var currentNumberOfRows: Int?
    var currentMediaTitle: String?
    var lastSelectedIndex: IndexPath?
    
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
    
    func set(numberOfRows currentNumberOfRows: Int) {
        self.currentNumberOfRows = currentNumberOfRows
    }
    
    func set(mediaTitle currentMediaTitle: String) {
        self.currentMediaTitle = currentMediaTitle
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectMediaType(at: indexPath)
    }
    
}
