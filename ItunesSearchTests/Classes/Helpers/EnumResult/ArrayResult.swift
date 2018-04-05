//
//  Result.swift
//  OutSideInsidePushNotifications
//
//  Created by Damir Zaripov on 30.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// The result of the method
///
/// - success: result with array of entity
/// - failure: failure with message
enum ArrayResult<T> {
    case success([T])
    case failure(String)
}
