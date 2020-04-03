//
//  ApplicationModuleFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

protocol ApplicationModuleFactory {
    func createErrorAlertModule(with title: String, and message: String) -> Presentable
    func createLoadingScreenModule() -> Presentable
}
