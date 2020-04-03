//
//  LaunchpadsModuleFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

extension ModuleFactory: LaunchpadsModuleFactory {
    func createLaunchpadDetailsModule(with launchpad: Launchpad) -> LaunchpadDetailsModule {
        let viewModel = LaunchpadDetailsViewModel(launchpad: launchpad)
        return LaunchpadDetailsViewController(viewModel: viewModel)
    }
    
    func createDisplayLaunchpadsModule(networkService: PromiseKitNetworkService, cellMaker: LaunchpadCellMaker) -> DisplayLaunchpadsModule {
        let viewModel = FetchingAndBGCachingViewModel<LaunchpadsMapper, Launchpad, LaunchpadCellMaker, RealmDatabaseService>(databaseService: RealmDatabaseService(), networkService: networkService, cellMaker: cellMaker)
        return DisplayLaunchpadsViewController(viewModel: viewModel)
    }
    
    func createLoadingScreenModule() -> Presentable {
        return LoadingScreenViewController()
    }
}
