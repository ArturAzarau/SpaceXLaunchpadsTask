//
//  CoordinatorFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class CoordinatorFactory {
    
    func makeLaunchpadsCoordinator(launchpadsStorage: LaunchpadsStorage) -> CoordinatorGroup<LaunchpadsCoordinatorProtocol> {
        let navigationController = UINavigationController()
        let coordinator = LaunchpadsCoordinator(moduleFactory: ModuleFactory(),
                                                router: Router(navigationController: navigationController),
                                                storage: launchpadsStorage)
        return CoordinatorGroup(coordinator: coordinator, presentable: navigationController)
    }
}
