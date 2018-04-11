//
//  UITableView+Extension.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

extension UITableView {
    
    enum CellReuseIdentifiers: String {
        case searchMedia
    }
    
    func register(_ nib: UINib?, forCellReuseIdentifier identifier: CellReuseIdentifiers) {
        self.register(nib, forCellReuseIdentifier: identifier.rawValue)
    }
    
    func dequeueReusableCell(withIdentifier identifier: CellReuseIdentifiers, for indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: identifier.rawValue, for: indexPath)
    }
    
}
