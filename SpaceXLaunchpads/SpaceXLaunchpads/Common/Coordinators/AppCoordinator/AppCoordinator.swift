//
//  AppCoordinator.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
        
    override func start() {
        showDisplayLaunchpadsModule()
    }
    
    // MARK: - Properties
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: AppRoutable
    private let storage: LaunchpadsStorage
    
    // MARK: - Init
    
    init(coordinatorFactory: CoordinatorFactory, router: AppRoutable, storage: LaunchpadsStorage) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.storage = storage
    }
    
    private func showDisplayLaunchpadsModule() {
        let module = coordinatorFactory.makeLaunchpadsCoordinator(launchpadsStorage: storage)
        router.setWindowRoot(module: module.presentable)
        bindTo(module.coordinator).start()
    }
}
