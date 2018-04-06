//
//  SettingsViewController.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, SettingsViewInput {
    
    @IBOutlet weak var mediaTypeLabel: UILabel!
    
    var presenter: SettingsViewOutput!
    
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
    
    func prepareTableView() {
        tableView.delegate = self
    }
    
    func set(mediaTypeTitle title: String) {
        mediaTypeLabel.text = title
    }

}

//MARK: - Table view delegates and datasources
extension SettingsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectSettingRow(at: indexPath)
    }
    
}
