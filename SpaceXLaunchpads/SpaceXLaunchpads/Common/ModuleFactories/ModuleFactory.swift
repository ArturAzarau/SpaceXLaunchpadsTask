//
//  ModuleFactory.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class ModuleFactory {
    func createErrorAlertModule(with title: String, and message: String) -> Presentable {
        return UIAlertController.infoAlert(with: title, and: message)
    }
}
