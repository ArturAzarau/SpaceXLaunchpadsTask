//
//  AppRouter.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class AppRouter: AppRoutable {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
//        makeWindowKeyAndVisible()
    }
    
    convenience init() {
        self.init(window: UIWindow())
    }
}
