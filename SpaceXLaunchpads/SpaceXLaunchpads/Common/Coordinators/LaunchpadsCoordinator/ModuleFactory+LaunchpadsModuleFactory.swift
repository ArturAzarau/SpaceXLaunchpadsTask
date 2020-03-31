//
//  LaunchpadsModuleFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

extension ModuleFactory: LaunchpadsModuleFactory {
    func createDisplayLaunchpadsModule(networkService: PromiseKitNetworkService, cellMaker: LaunchpadCellMaker) -> DisplayLaunchpadsModule {
        let viewModel = FetchingAndBGCachingViewModel<LaunchpadsMapper, Launchpad, LaunchpadCellMaker, RealmDatabaseService>(databaseService: RealmDatabaseService(), networkService: networkService, cellMaker: cellMaker)
        return FetchingVC(viewModel: viewModel)
    }
    
    func createLaunchpadDetailsModule() {
        
    }
}
