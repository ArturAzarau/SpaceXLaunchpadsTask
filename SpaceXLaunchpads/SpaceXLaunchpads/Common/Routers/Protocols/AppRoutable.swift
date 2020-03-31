//
//  AppRoutable.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol AppRoutable {
    var window: UIWindow { get }
    
    func setWindowRoot(module: Presentable)
    func makeWindowKeyAndVisible()
    
    func openWindow(withModule presentable: Presentable, level: UIWindow.Level.LaunchpadsLevel)
    func closeWindow(level: UIWindow.Level.LaunchpadsLevel)
}

extension AppRoutable {
    func setWindowRoot(module: Presentable) {
        window.rootViewController = module.toPresent()
        makeWindowKeyAndVisible()
    }
    
    func makeWindowKeyAndVisible() {
        window.makeKeyAndVisible()
    }
}
