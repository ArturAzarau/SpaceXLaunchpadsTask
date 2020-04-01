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
    private let router: AppRouter
    private let storage: LaunchpadsStorage
    private let moduleFactory: ModuleFactory
    
    // MARK: - Init
    
    init(coordinatorFactory: CoordinatorFactory,
         router: AppRouter,
         storage: LaunchpadsStorage,
         moduleFactory: ModuleFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.storage = storage
        self.moduleFactory = moduleFactory
    }
    
    private func showDisplayLaunchpadsModule() {
        let module = coordinatorFactory.makeLaunchpadsCoordinator(launchpadsStorage: storage)
        module.coordinator.onError = { [weak self] in
            self?.showErrorModule(with: $0)
        }
        router.setWindowRoot(module: module.presentable)
        bindTo(module.coordinator).start()
    }
    
    func showErrorModule(with error: Error) {
        let module = moduleFactory.createErrorAlertModule(with: .error, and: error.localizedDescription)
        router.presentModule(module)
    }
}
