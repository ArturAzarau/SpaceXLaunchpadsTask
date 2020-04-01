//
//  UIAlertController+Extensions.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 01.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func infoAlert(with title: String?, and message: String?) -> UIAlertController {
        let okAction = UIAlertAction(title: .ok, style: .default)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okAction)
        
        return alertController
    }
}
