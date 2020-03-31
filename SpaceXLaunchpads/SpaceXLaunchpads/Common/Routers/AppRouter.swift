//
//  AppRouter.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class AppRouter: AppRoutable {
    
    private var windows: [UIWindow.Level.LaunchpadsLevel: UIWindow] = [:]

    let window: UIWindow

    var rootController: UIViewController? {
        return window.rootViewController
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    convenience init() {
        let level = UIWindow.Level.LaunchpadsLevel.normal
        let window = UIWindow(level: level)
        self.init(window: window)
    }
    
    func openWindow(withModule presentable: Presentable, level: UIWindow.Level.LaunchpadsLevel) {
        let window = windows[level] ?? UIWindow(level: level)
        windows[level] = window

        if !window.isKeyWindow {
            window.makeKeyAndVisible()
        }
        window.rootViewController = presentable.toPresent()
    }
    
    func closeWindow(level: UIWindow.Level.LaunchpadsLevel = .normal) {
        guard let window = windows[level] else {
            return
        }

        windows[level] = nil
        window.rootViewController?.view.isUserInteractionEnabled = false
        window.rootViewController = nil
        window.isHidden = true
    }
}
