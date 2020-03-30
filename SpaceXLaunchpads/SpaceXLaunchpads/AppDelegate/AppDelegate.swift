//
//  AppDelegate.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var coordinator: AppCoordinator = {
        let router = AppRouter()
        let coordinatorFactory = CoordinatorFactory()
        let storage = LaunchpadsStorage()
        return .init(coordinatorFactory: coordinatorFactory,
                     router: router,
                     storage: storage)
    }()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        coordinator.start()

        return true
    }
}

