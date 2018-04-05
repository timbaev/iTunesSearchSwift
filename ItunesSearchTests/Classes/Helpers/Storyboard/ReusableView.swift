//
//  ReusableView.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

/// For instantiate view controller from storyboard
protocol ReusableView: class {
}

extension ReusableView {
    
    /// Identifier is name of view controller
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableView {
}

extension UIStoryboard {
    func instantiateViewController<T>() -> T where T: ReusableView {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
}

