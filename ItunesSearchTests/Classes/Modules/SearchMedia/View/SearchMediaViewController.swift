//
//  SearchMediaViewController.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class SearchMediaViewController: UIViewController, SearchMediaViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var searchController: UISearchController = {
        return UISearchController(searchResultsController: nil)
    }()
    
    var presenter: SearchMediaViewOutput!
    var searchMediaDatasource: SearchMediaDatasourceInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    //MARK: - View input
    
    func prepareTableView() {
        let nib = UINib(nibName: "SearchMediaTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: .searchMedia)
        
        tableView.delegate = searchMediaDatasource
        tableView.dataSource = searchMediaDatasource
    }
    
    func prepareSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func set(cellModels models: [SearchMediaCellModel]) {
        searchMediaDatasource.set(cellModels: models)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func clearAllData() {
        searchMediaDatasource.clear()
    }
    
    func prepareDatasource() {
        searchMediaDatasource.downloadImageDelegate = presenter as? DownloadImageDelgate
        searchMediaDatasource.selectDelegate = presenter as? OnCellSelectDelegate
    }
    
    func set(image: UIImage, at indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        searchMediaDatasource.set(image: image, to: cell)
    }
    
}

extension SearchMediaViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        presenter.didUpdateSearchText(searchText)
    }

}
