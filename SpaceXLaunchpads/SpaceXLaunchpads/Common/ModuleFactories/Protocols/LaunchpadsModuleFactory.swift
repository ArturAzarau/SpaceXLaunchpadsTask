//
//  DisplayLaunchpadsModuleFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

protocol LaunchpadsModuleFactory {
    
    func createDisplayLaunchpadsModule(networkService: PromiseKitNetworkService,
                                       cellMaker: LaunchpadCellMaker) -> DisplayLaunchpadsModule
    func createLaunchpadDetailsModule(with launchpad: Launchpad) -> Presentable
    func createErrorAlertModule(with title: String, and message: String) -> Presentable
}
