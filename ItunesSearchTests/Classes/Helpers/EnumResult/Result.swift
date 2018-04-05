//
//  EnumResult.swift
//  OutSideInsidePushNotifications
//
//  Created by Тимур Шафигуллин on 01.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Enum with response reults
///
/// - success: success result of response
/// - failure: failure result of response
enum Result<T> {
    case success(T)
    case failure(String)
}
