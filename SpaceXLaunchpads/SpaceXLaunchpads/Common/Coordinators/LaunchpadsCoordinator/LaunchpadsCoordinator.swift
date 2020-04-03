//
//  LaunchpadsCoordinator.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

protocol LaunchpadsCoordinatorProtocol: Coordinatable {
    var onError: ParameterClosure<Error>? { get set }
    var onLoading: ParameterClosure<Bool>? { get set }
}

final class LaunchpadsCoordinator: BaseCoordinator, LaunchpadsCoordinatorProtocol {
    
    var onError: ParameterClosure<Error>?
    var onLoading: ParameterClosure<Bool>?
    
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
        let module = moduleFactory.createDisplayLaunchpadsModule(networkService: storage.promiseKitNetworkService,
                                                                 cellMaker: storage.launchpadCellMaker)
        module.onError = onError
        module.onLoading = onLoading
        
        module.onItemSelected = { [weak self] in
            guard let self = self else {
                return
            }
            let module = self.moduleFactory.createLaunchpadDetailsModule(with: $0)
            self.router.pushModule(module, animated: true)
        }
        router.setRootModule(module, animated: true)
    }
}
