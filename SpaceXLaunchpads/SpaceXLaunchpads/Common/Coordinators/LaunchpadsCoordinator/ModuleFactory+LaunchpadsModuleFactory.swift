//
//  LaunchpadsModuleFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

extension ModuleFactory: LaunchpadsModuleFactory {
    func createDisplayLaunchpadsModule() -> DisplayLaunchpadsModule {
        return ViewController()
    }
    
    func createLaunchpadDetailsModule() {
        
    }
}
