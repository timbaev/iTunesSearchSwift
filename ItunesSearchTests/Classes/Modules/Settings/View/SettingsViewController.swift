//
//  SettingsViewController.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, SettingsViewInput {
    
    var presenter: SettingsViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    func prepareTableView() {
        tableView.delegate = self
    }

}

extension SettingsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectSettingRow(at: indexPath)
    }
    
}
