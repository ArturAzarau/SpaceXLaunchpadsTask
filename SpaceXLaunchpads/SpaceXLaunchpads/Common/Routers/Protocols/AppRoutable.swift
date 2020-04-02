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
