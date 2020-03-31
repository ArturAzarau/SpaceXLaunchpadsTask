//
//  LaunchpadsCoordinator.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

protocol LaunchpadsCoordinatorProtocol: Coordinatable {}

final class LaunchpadsCoordinator: BaseCoordinator, LaunchpadsCoordinatorProtocol {
    
    // MARK: - Coordinatable
        
    override func start() {
        showDisplayLaunchpadsModule()
    }
    
    // MARK: - Properties
    
    private let moduleFactory: LaunchpadsModuleFactory
    private let router: StackRoutable
    private let storage: LaunchpadsStorage
    
    // MARK: - Init
    
    init(moduleFactory: LaunchpadsModuleFactory, router: StackRoutable, storage: LaunchpadsStorage) {
        self.moduleFactory = moduleFactory
        self.router = router
        self.storage = storage
    }
    
    private func showDisplayLaunchpadsModule() {
        let module = moduleFactory.createDisplayLaunchpadsModule()
        router.setRootModule(module, animated: true)
    }
}