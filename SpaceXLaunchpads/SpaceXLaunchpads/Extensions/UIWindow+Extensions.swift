//
//  UIWindow+Extensions.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

extension UIWindow.Level {
    enum LaunchpadsLevel: Int {
        case normal = 0
        case alert
        case error
        
        var value: UIWindow.Level {
            return UIWindow.Level.normal + CGFloat(rawValue)
        }
    }
}

extension UIWindow {
    convenience init(level: UIWindow.Level.LaunchpadsLevel) {
        self.init(frame: UIScreen.main.bounds)
        windowLevel = level.value
    }
}
